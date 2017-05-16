class AddSupplierIdToCompters < ActiveRecord::Migration[5.1]
  def change
    add_column :compters, :supplier_id, :integer
  end
end
