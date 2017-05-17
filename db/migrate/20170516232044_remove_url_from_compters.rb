class RemoveUrlFromCompters < ActiveRecord::Migration[5.1]
  def change
    remove_column :compters, :image, :string
    remove_column :compters, :computer_id, :integer
    add_column :images, :computer_id, :integer
  end
end
