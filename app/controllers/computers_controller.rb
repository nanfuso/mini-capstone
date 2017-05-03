class ComputersController < ApplicationController
    def computer
        @computers = Compter.all
        render 'computers_for_sale.html.erb'
    end
end
