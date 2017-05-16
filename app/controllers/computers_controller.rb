class ComputersController < ApplicationController
    def index
        @computers = Compter.all
        sort_attribute = params[:sort]
        sort_order = params[:sort_order]
        discount = params[:discount]
        search_term = params[:search_term]

        if search_term
            @computers = Compter.where(
                                        "name iLIKE ? OR description iLIKE ?", 
                                        "%#{search_term}%", 
                                        "%#{search_term}%"
                                        )
        end

        if discount
            @computers = @computers.where("price < ?", discount)
        end

        if sort_attribute && sort_order
            @computers = @computers.order(sort_attribute => sort_order)
        elsif sort_attribute
            @computers = @computers.order(sort_attribute)
        end
    end

    def show
        @computer = Compter.find(params[:id])
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

    def random
        computer = Compter.all.sample
        redirect_to "/computers/#{computer.id}"
    end
end
