class Changepropertycolumnwaitlists < ActiveRecord::Migration[6.1]
  def change
    rename_column :waitlists, :property, :property_id
  end
end
