class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            flash[:success] = 'Welcome! Come on in!'
            redirect_to '/'
        else
            flash[:warning] = "Sorry, Charlie, no golden ticket this time.  Try again"
            redirect_to '/login'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = "K bye"
        redirect_to '/login'
    end
end
