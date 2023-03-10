class RenamePasswordFieldAgent < ActiveRecord::Migration[6.1]
  def change
    rename_column :agents, :password, :password_digest
  end
end
