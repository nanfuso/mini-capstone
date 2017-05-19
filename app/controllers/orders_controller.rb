class OrdersController < ApplicationController

    def create
        @compter = Compter.find(params[:compter_id])
        order = Order.new(
                            quantity: params[:quantity],
                            user_id: current_user.id,
                            compter_id: params[:compter_id],
                            subtotal: @compter.price,
                            tax: @compter.tax,
                            total: @compter.total_price
                            )
        order.save
        redirect_to "/orders/#{order.id}"
    end

    def show
        @order = Order.find(params[:id])
        @compter = Compter.find(@order.compter_id)
    end

end
