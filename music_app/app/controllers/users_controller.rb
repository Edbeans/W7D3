class UsersController < ApplicationController
    #ability to sign up 

    before_action :require_logged_out, only: [:new, :create] # allows us to only see new and create 

    def index 
        @user = User.all
        render :index 
    end
    
    def create 
        @user = User.new(user_params) 
        if @user.save 
            login!(@user)
            redirect_to users_url
        else
            render json: @user.errors.full_messages, status: 422 
        end
    end
    
    def new
        @user = User.new 
        render :new 
    end

    def edit 
        @user = User.find_by(id: params[:id])
        render :edit 
    end

    def show 
        @user = User.find_by(id: params[:id]) 
        render :show 
    end

    def update 
        @user = User.find_by(id: params[:id])
        if @user.update(user_params)
            redirect_to user_url(@user) 
        else
            render json: @user.errors.full_messages, status: 422 
        end
    end

    def destroy 
        @user = User.find_by(id: params[:id])
        @user.destroy 
        redirect_to users_url 
    end
    
    private

    def user_params
        params.require(:user).permit(:email, :password) 
    end
end
