class Setpropertyattributesnonnull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :properties, :name, false
    change_column_null :properties, :address, false
    change_column_null :properties, :size, false
    change_column_null :properties, :start_date, false
    change_column_null :properties, :fee, false
    change_column_null :properties, :rent, false
  end
end
