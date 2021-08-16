class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :category
      t.string :address
      t.text :description
      t.float :price
      t.boolean :available, null: false, default: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
