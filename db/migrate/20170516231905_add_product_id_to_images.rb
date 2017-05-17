class AddProductIdToImages < ActiveRecord::Migration[5.1]
  def change
    add_column :compters, :computer_id, :integer
  end
end
