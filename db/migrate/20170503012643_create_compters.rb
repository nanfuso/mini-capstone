class CreateCompters < ActiveRecord::Migration[5.1]
  def change
    create_table :compters do |t|
      t.string :name
      t.string :price
      t.string :image
      t.string :description

      t.timestamps
    end
  end
end
