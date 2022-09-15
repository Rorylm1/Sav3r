class CreateBaskets < ActiveRecord::Migration[7.0]
  def change
    create_table :baskets do |t|
      t.float :total_price
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
