class CreateClothes < ActiveRecord::Migration
  def change
    create_table :closet_clothes do |t|
      t.integer :closet_id
      t.string :name_of_article
      t.string :type_of_clothing # ex shirt, pants
      t.string :description_of_clothes # ex stain on sleeve, doesnt fit...
    end
  end
end
