class SessionsController < ApplicationController
    def create
        @user = User.find_or_create_from_auth_hash(auth_hash)
        self.current_user = @user
        redirect_to 'dashboard'
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path
    end

    protected

    def auth_hash
        request.env['omniauth.auth']
    end
end