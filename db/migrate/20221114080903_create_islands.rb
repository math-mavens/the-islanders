class CreateIslands < ActiveRecord::Migration[7.0]
  def change
    create_table :islands do |t|
      t.string :name
      t.text :description
      t.decimal :price_per_day
      t.float :latitude
      t.float :longitude
      t.string :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
