class MakeChangestoImages < ActiveRecord::Migration[5.1]
  def change
    rename_column :images, :computer_id, :compter_id
  end
end
