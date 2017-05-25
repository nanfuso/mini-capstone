class OrdersController < ApplicationController

    def create
        carted_products = current_user.cart

        subtotal = 0

        carted_products.each do |carted_product|
            subtotal += carted_product.compter.price * carted_product.quantity
        end

        tax = subtotal * 0.09
        total = subtotal + tax

        order = Order.new( 
                            user_id: current_user.id,
                            subtotal: subtotal,
                            tax: tax,
                            total: total
                            )

        order.save
        carted_products.update_all(status: "purchased", order_id: order.id)

        redirect_to "/orders/#{order.id}"
    end

    def show
        @order = Order.find(params[:id])
    end


end
