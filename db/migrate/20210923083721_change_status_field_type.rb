class ChangeStatusFieldType < ActiveRecord::Migration[6.1]
  def change
    change_column :requests, :status, :string
  end
end
