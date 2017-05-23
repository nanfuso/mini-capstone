class CreateCategoryCompters < ActiveRecord::Migration[5.1]
  def change
    create_table :category_compters do |t|
      t.integer :category_id
      t.integer :compter_id

      t.timestamps
    end
  end
end
