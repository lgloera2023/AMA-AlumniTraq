# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :check_admin_authority, only: %i[index new create destroy]
  helper_method :is_sign_up?

  # GET /users or /users.json
  def index
    @users = User.order(:last_name)
  end

  # GET /users/1 or /users/1.json
  def show; end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    Current.previous_path = if session[:user_id] == @user.id
                              "/users/#{String(@user.id)}"
                            else
                              '/admin'
                            end
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        # Login the new user if not an admin
        session[:user_id] = @user.id unless Current.user.is_admin?

        # If new user is an alumnus, redirect to collect alumnus-specific information
        if @user.is_alumnus?
          handle_create_alumnus(format)
        else
          handle_normal_create(format)
        end

      else
        # Failed to save user
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @user.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if session[:is_signup]
        handle_signup(format)
      else
        # First check if switching roles
        role_change = check_role_change

        if @user.update(user_params)
          if role_change[:to_alumnus]
            handle_create_alumnus(format)
          elsif role_change[:from_alumnus]
            # No longer alumnus, need to remove extra info
            alumnus_info = Alumnus.find_by(user: @user)
            alumnus_info&.destroy!
            format.html { redirect_to(user_url(@user), notice: 'Profile was successfully updated and alumnus info destroyed.') }
            format.json { render(:show, status: :ok, location: @user) }
          else
            # Normal update
            format.html { redirect_to(user_url(@user), notice: 'Profile was successfully updated.') }
            format.json { render(:show, status: :ok, location: @user) }
          end
        else
          format.html { render(:edit, status: :unprocessable_entity) }
          format.json { render(json: @user.errors, status: :unprocessable_entity) }
        end
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to(Current.previous_path, notice: 'User was successfully destroyed.') }
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:email, :role_id, :first_name, :last_name,
                                 :major_id, :graduation_year, :phone
    )
  end

  def check_admin_authority
    render_unauthorized unless Current.user.is_admin?
  end

  def handle_create_alumnus(format)
    # Create new alumnus and set the FK to the new user
    @alumnus = Alumnus.new
    @alumnus.user = @user
    if @alumnus.save
      format.html { redirect_to(edit_alumnus_path(@alumnus), notice: 'User was successfully saved.') }
      format.json { render(:update, status: :created, location: @user) }
    else
      format.html do
        redirect_to(new_alumnus_path, notice: "User was successfully saved but couldn't save alumnus.")
      end
      format.json { render(:new, status: :created, location: @user) }
    end
  end

  def handle_normal_create(format)
    # See if user is admin (need special case for RSpec)
    Current.user = User.find_by(id: Integer(ENV['user_id'])) if Rails.env.test? && ENV['user_id']

    format.html { redirect_to(user_url(@user), notice: 'User was successfully created.') }
    format.json { render(:show, status: :created, location: @user) }
  end

  def handle_signup(format)
    if @user.update(user_params)
      session[:is_signup] = nil
      session[:user_id] = @user.id

      if @user.is_alumnus?
        handle_create_alumnus(format)
      else
        format.html { redirect_to(root_path, notice: 'Account successfully created.') }
        format.json { render(:index, status: :created, location: @user) }
      end
    else
      format.html { render('users/signup', status: :unprocessable_entity) }
      format.json { render(json: @user.errors, status: :unprocessable_entity) }
    end
  end

  def check_role_change
    to_alumnus = false
    from_alumnus = false

    if user_params[:role_id]
      params_role_id = Integer(user_params[:role_id])
      user_role_id = @user.role.id

      if params_role_id
        if params_role_id == 3 && user_role_id != 3
          to_alumnus = true
        elsif params_role_id != 3 && user_role_id == 3
          from_alumnus = true
        end
      end
    end

    { to_alumnus: to_alumnus, from_alumnus: from_alumnus }
  end
end
