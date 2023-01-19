class SessionsController < ApplicationController
    #ability to sign in because you're signing in to the session 
    
    before_action :require_logged_in, only: [:destroy] # allows us to only destroy (logout) when in a session

    def new 
        @user = User.new 
        render :new 
    end
end
