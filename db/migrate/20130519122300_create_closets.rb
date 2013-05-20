class CreateClosets < ActiveRecord::Migration
  def change
    create_table :closets do |t|
      t.integer :closet_owner_id
    end
  end
end