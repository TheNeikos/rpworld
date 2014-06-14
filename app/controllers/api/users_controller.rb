module Api
  class UsersController < ApplicationController
    load_and_authorize_resource
    def index
    end

    def show
    end

    def create
      if @user.save
        redirect_to :users
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
        flash[:success] = "Successfully signed in #{@user.displayname}."
        redirect_to :regions
      else
        flash.now[:error] = "Could not sign in"
      end

    end

    def logout
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
