# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :set_current_user, only: %i[new create]
  skip_before_action :set_smart_link, only: %i[ update edit ]
  before_action :set_user, only: %i[show edit update destroy]
  before_action :check_admin_authority, only: %i[index destroy]
  helper_method :is_sign_up?

  # GET /users or /users.json
  def index
    @users = User.order(:last_name)
  end

  # GET /users/1 or /users/1.json
  def show
    Current.previous_path = "/settings"
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit 
    if session[:user_id] == @user.id
      Current.previous_path = "/users/" + String(@user.id)
    else
      Current.previous_path = "/admin"
    end
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    if is_sign_up?
      @user.save
      respond_to do |format|
        format.html { redirect_to(login_path, notice: "Waiting Admin Approval")}
      end
      return
    end
    respond_to do |format|
      if @user.save
        # Login the new user not an admin
        session[:user_id] = @user.id unless @user.is_admin?

        # If new user is an alumnus, redirect to collect alumnus-specific information
        if @user.is_alumnus?
          # Create new alumnus and set the FK to the new user
          @alumnus = Alumnus.new
          @alumnus.user = @user
          if @alumnus.save
            format.html { redirect_to(edit_alumnus_path(@alumnus), notice: 'User was successfully created.') }
            format.json { render(:update, status: :created, location: @user) }
          else
            format.html do
              redirect_to(new_alumnus_path, notice: "User was successfully created but couldn't save alumnus.")
            end
            format.json { render(:new, status: :created, location: @user) }
          end
        elsif @user.is_admin?
          # Admin, show the confirmation
          format.html { redirect_to(user_url(@user), notice: 'User was successfully created.') }
          format.json { render(:show, status: :created, location: @user) }
        else
          # Standard role, just login
          format.html { redirect_to(root_path, notice: "Logged in as #{@user.first_name} #{@user.last_name}") }
        end
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @user.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        if session[:user_id] == @user.id
          format.html { redirect_to(settings_url, notice: 'Profile was successfully updated.') }
        else
          format.html { redirect_to(admin_index_path, notice: 'User was successfully updated.') }
        end
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @user.errors, status: :unprocessable_entity) }
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
    params.require(:user).permit(:email, :password, :password_confirmation, :role_id, :first_name, :last_name,
                                 :major_id, :graduation_year, :phone
    )
  end

  def check_admin_authority
    render_unauthorized unless Current.user.is_admin?
  end
end
