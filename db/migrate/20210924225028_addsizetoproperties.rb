class Addsizetoproperties < ActiveRecord::Migration[6.1]
  def change
    add_column :properties, :size, :string
  end
end
