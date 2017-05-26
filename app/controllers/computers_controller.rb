class ComputersController < ApplicationController
   before_action :authenticate_admin!, except: [:index, :show, :random]


    def index
        @computers = Compter.all
        sort_attribute = params[:sort]
        sort_order = params[:sort_order]
        discount = params[:discount]
        search_term = params[:search_term]
        supplier_sort = params[:supplier_sort]
        category = params[:category]

        if category
            @computers = Category.find_by(name: category).compters
        end

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

        if supplier_sort
            @computers = @computers.where("supplier_id = ?", supplier_sort)
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
        @computer = Compter.new
    end

    def create
        @computer = Compter.new(
                                name: params[:name],
                                price: params[:price],
                                description: params[:description],
                                supplier_id: params[:supplier][:supplier_id]
                                )
        if @computer.save
            flash[:success] = "Post Successfully Created!"
            redirect_to "/computers/#{computer.id}"
        else
            render 'new.html.erb'
        end
    end

    def edit   
        @computer = Compter.find(params[:id])
    end

    def update
        @computer = Compter.find(params[:id])
        @computer.assign_attributes(
                                    name: params[:name],
                                    price: params[:price],
                                    description: params[:description],
                                    supplier_id: params[:supplier][:supplier_id]
                                    )
        if @computer.save
            flash[:success] = "Post Updated"
        else
            render 'edit.html.erb'
        end
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
