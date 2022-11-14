# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :set_current_user
  before_action :set_smart_link

  def set_locale
    I18n.locale = if user_signed_in?
                    current_user.language
                  else
                    params[:lang] || locale_from_header || I18n.default_locale
                  end
  end

  def locale_from_header
    request.env.fetch('HTTP_ACCEPT_LANGUAGE', '').scan(/[a-z]{2}/).first
  end

  def set_current_user
    if Rails.env.test?
      # Just check if current user is set
      if ENV['user_id']
        Current.user = User.find_by(id: Integer(ENV['user_id']))
      else
        redirect_to(login_path)
      end
    elsif session[:user_id]
      Current.user = User.find_by(id: session[:user_id])

      if Current.user.nil?
        # Remove user from session
        session[:user_id] = nil

        # Redirect to login page
        redirect_to(login_path)
      end
    elsif !session[:is_signup]
      redirect_to(login_path)
    end
  end

  def render_unauthorized
    respond_to do |format|
      format.html { render(file: 'public/401.html', layout: false, status: :unauthorized) }
      format.xml  { head(:unauthorized) }
      format.any  { head(:unauthorized) }
    end
  end

  def is_sign_up?
    Current.user.blank?
  end

  def set_smart_link
    if Rails.env.test?
      Current.previous_path = ENV['current_path']
      ENV['current_path'] = request.path
    else
      Current.previous_path = session[:current_path]
      session[:current_path] = request.path
    end
  end
end
