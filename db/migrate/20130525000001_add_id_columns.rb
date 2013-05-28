class AddIdColumns < ActiveRecord::Migration
  def change
    add_column :clothings, :style, :string
    add_column :clothings, :temperature, :string

    # add_column :clothings, :style_id, :string
    # add_column :clothings, :temperature_id, :string

    # add_index :clothings, :style_id
    # add_index :clothings, :temperature_id
  end
end