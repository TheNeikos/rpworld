module Api
  class UsersController < ApplicationController
    load_and_authorize_resource
    def index
    end

    def show
    end

    def create
      if @user.save
        redirect_to :me
      else
        render :new
      end
    end

    def new
    end

    def login
      puts login_params.inspect
      if @user = User.find_by_email(login_params[:email]).authenticate(login_params[:password]) then
        session[:user_id] = @user.id
        render :me
      else
        flash.now[:error] = "Could not sign in"
        # TODO: Add json error response
      end
    end

    def logout
      if logged_in?
        session[:user_id] = nil
      end
    end

    def me
      render :me if logged_in?
    end

    private
    def create_params
      params.require(:user).permit(:displayname, :password, :email)
    end

    def login_params
      params.require(:user).permit(:email, :password)
    end

  end
end
