class UsersController < ApplicationController

    def new

    end

    def create
        user = User.new(
                        name: params[:name],
                        email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation]
                        )

        if user.save
            session[:user_id] = user.id
            flash[:success] = "You created an account! Go you!!"
            redirect_to '/'
        else
            flash[:warning] = "Sorry, Charlie, no golden ticket this time.  Try again"
            redirect_to '/signup'
        end
    end
end
