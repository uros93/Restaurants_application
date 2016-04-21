class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :nick, :string
    add_column :users, :description, :text
    add_column :restaurants, :votes, :integer
    add_column :users, :admin, :boolean
    add_reference :critics, :user, index: true, foreign_key: true
    add_reference :restaurants, :user, index: true, foreign_key: true
    rename_column :restaurants, :naziv, :name
    rename_column :restaurants, :opis, :description
  end
end
