class CreateClosetOwners < ActiveRecord::Migration
  def change
    create_table :closet_owners do |t|
      t.string :name
      t.integer :closet_id
    end
  end
end