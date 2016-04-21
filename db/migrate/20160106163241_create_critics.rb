class CreateCritics < ActiveRecord::Migration
  def change
    create_table :critics do |t|
      t.string :title
      t.text :content
      

      t.timestamps null: false
    end
  end
end
