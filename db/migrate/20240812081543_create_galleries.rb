class CreateGalleries < ActiveRecord::Migration[7.1]
  def change
    create_table :galleries do |t|
      t.string :name
      t.string :address
      t.text :description
      t.boolean :availability
      t.float :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
