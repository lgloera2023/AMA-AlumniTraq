class UsersController < ApplicationController
  skip_before_action :set_current_user, :only => [:new, :create]
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        # Login the new user
        session[:user_id] = @user.id

        # If new user is an alumnus, redirect to collect alumnus-specific information
        if @user.role.name == "Alumni"
          # Create new alumnus and set the FK to the new user
          @alumnus = Alumnus.new
          @alumnus.user = @user
          if @alumnus.save
            format.html { redirect_to edit_alumnus_path(@alumnus), notice: "User was successfully created." }
            format.json { render :update, status: :created, location: @user }
          else
            format.html { redirect_to new_alumnus_path, notice: "User was successfully created but couldn't save alumnus." }
            format.json { render :new, status: :created, location: @user }
          end
        else
          # Standard role, show the confirmation
          format.html { redirect_to user_url(@user), notice: "User was successfully created." }
          format.json { render :show, status: :created, location: @user }
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :role_id, :first_name, :last_name, :major_id, :graduation_year, :phone)
    end
end
