# frozen_string_literal: true

# app/controllers/users/omniauth_callbacks_controller.rb:

module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    skip_before_action :set_current_user

    def google_oauth2
      handle_auth('Google')
    end

    def facebook
      handle_auth('Facebook')
    end

    def linkedin
      handle_auth('LinkedIn')
    end

    def handle_auth(_provider)
      # Implemented in app/models/user.rb
      response = User.from_omniauth(request.env['omniauth.auth'])
      @user = response[:user]
      session[:is_signup] = response[:is_signup]

      if session[:is_signup]
        @user.graduation_year = nil
        @user.role = nil
        @user.major = nil
        render('users/signup')
      else
        session[:user_id] = @user.id
        redirect_to(root_path)
      end
    end
  end
end
