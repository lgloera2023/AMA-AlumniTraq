# frozen_string_literal: true

class AdminController < ApplicationController
  before_action :check_admin_authority

  def index
    @users = User.unapproved_users
  end

  def documentation; end

  def approve
    @user = User.find(Integer(approval_param[:user_id]))
    if @user.update(is_approved: true)
      respond_to do |format|
        format.html { redirect_to(admin_index_path, notice: 'User approved.') }
      end
    else
      respond_to do |format|
        format.html { redirect_to(admin_index_path, notice: 'User could not be approved.') }
      end
    end
  end

  private

  def approval_param
    params.permit(:user_id)
  end

  def check_admin_authority
    render_unauthorized unless Current.user.is_admin?
  end
end
