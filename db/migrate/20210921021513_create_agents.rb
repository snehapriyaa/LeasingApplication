class CreateAgents < ActiveRecord::Migration[6.1]
  def change
    create_table :agents do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :phone

      t.timestamps
    end
  end
end
