class CreateClothes < ActiveRecord::Migration
  def change
    create_table :clothings do |t|
      t.string :name #description
      t.integer :style_id
      t.integer :temperature_id
    end
  end
end