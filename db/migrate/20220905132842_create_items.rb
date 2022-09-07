class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.float :price
      t.text :description
      t.string :brand
      t.string :volume
      t.string :category
      t.string :shop

      t.timestamps
    end
  end
end
