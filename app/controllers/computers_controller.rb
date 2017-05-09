class ComputersController < ApplicationController
    def index
        @computers = Compter.all
    end

    def show
        computer_id = params[:id]
        @computer = Compter.find_by(id: computer_id)
    end

    def new
    end

    def create
        computer = Compter.new(
                                name: params[:name],
                                price: params[:price],
                                description: params[:description]
                                )
        computer.save

        flash[:success] = "Post Successfully Created!"
        redirect_to "/computers/#{computer.id}"
    end

    def edit
        @computer = Compter.find(params[:id])
    end

    def update
        computer = Compter.find(params[:id])
        computer.assign_attributes(
                                    name: params[:name],
                                    price: params[:price],
                                    description: params[:description]
                                    )
        computer.save
        flash[:success] = "Post Updated"
        redirect_to "/computers/#{computer.id}"
    end

    def destroy
        computer = Compter.find(params[:id])
        computer.destroy
        flash[:danger] = "Post Destroyed!"
        redirect_to "/"
    end
end
