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
    end
end
