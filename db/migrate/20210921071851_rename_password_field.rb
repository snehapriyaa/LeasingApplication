class RenamePasswordField < ActiveRecord::Migration[6.1]
  def change
    rename_column :applicants, :password, :password_digest
  end
end
