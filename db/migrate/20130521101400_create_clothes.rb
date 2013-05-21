class CreateClothes < ActiveRecord::Migration
  def change
    create_table :closet_clothes do |t|
      t.string :description
      t.integer :style_id
      t.integer :temperature_id
    end
  end
end