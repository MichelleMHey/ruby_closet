class AddClassColumnClothes < ActiveRecord::Migration
  def change
    add_column :clothings, :clothing_type, :string
  end
end