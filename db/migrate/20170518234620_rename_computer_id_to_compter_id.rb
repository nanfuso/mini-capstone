class RenameComputerIdToCompterId < ActiveRecord::Migration[5.1]
  def change
    rename_column :orders, :computer_id, :compter_id
  end
end
