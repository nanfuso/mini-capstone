class OrdersController < ApplicationController

    def create
        @compter = Compter.find(params[:compter_id])
        order = Order.new(
                            quantity: params[:quantity],
                            user_id: current_user.id,
                            compter_id: params[:compter_id],
                            )
        
        order.subtotal_with_quantity
        order.tax_with_quantity
        order.total_with_quantity

        order.save
        redirect_to "/orders/#{order.id}"
    end

    def show
        @order = Order.find(params[:id])
        @compter = Compter.find(@order.compter_id)
    end

end
