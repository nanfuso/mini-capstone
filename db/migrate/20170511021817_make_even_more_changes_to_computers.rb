class MakeEvenMoreChangesToComputers < ActiveRecord::Migration[5.1]
  def change
    add_column :compters, :price, :decimal, precision: 6, scale: 2
  end
end
