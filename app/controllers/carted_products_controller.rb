class CartedProductsController < ApplicationController
    def create
        @compter = Compter.find(params[:compter_id])
        carted_product = CartedProduct.new(
                            quantity: params[:quantity],
                            user_id: current_user.id,
                            compter_id: params[:compter_id],
                            status: "carted"
                            )
        
        carted_product.save

        redirect_to "/cart"
    end
end
