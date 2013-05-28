class CreateClothes < ActiveRecord::Migration
  def self.up
    create_table :clothings do |t|
      t.string :name
    end
  end

  def self.down
    drop_table :clothings
  end
end