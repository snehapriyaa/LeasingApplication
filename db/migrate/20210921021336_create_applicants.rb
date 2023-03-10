class CreateApplicants < ActiveRecord::Migration[6.1]
  def change
    create_table :applicants do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :phone

      t.timestamps
    end
  end
end
