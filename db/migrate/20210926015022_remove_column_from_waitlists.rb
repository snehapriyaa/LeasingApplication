class RemoveColumnFromWaitlists < ActiveRecord::Migration[6.1]
  def change
    remove_column :waitlists, :property, :integer
  end
end
