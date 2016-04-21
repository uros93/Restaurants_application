class AddRestaurnatToCritic < ActiveRecord::Migration
  def change
    add_reference :critics, :restaurant, index: true, foreign_key: true
  end
end
