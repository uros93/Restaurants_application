class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :naziv
      t.text :opis
      t.string :adresa

      t.timestamps null: false
    end
  end
end
