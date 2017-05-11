class MakeMoreChangesToComputers < ActiveRecord::Migration[5.1]
  def change
    remove_column :compters, :price, :string
    add_column :compters, :stock, :boolean, default: true
  end
end
