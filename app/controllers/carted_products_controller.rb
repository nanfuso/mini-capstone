class CartedProductsController < ApplicationController
    
    before_action :authenticate_user!
    
    def index
        if current_user && current_user.cart.any?
            @carted_products = current_user.cart
        else 
            flash[:warning] = "Buy something or leave, k?"
            redirect_to '/'
        end
    end

    def create
         
        @compter = Compter.find(params[:compter_id])
        carted_products = CartedProduct.new(
                            quantity: params[:quantity],
                            user_id: current_user.id,
                            compter_id: params[:compter_id],
                            status: "carted"
                            )
        
        carted_products.save
        flash[:success] = "Item added to cart!"

        redirect_to "/carted_products"
    end

    def destroy

        carted_product = CartedProduct.find(params[:id])
        carted_product.update(status: "removed")
        flash[:success] = "Item removed from cart."
        redirect_to '/carted_products'
    end

end
