class CreateWaitlists < ActiveRecord::Migration[6.1]
  def change
    create_table :waitlists do |t|
      t.string :applicant
      t.date :datetime
      t.integer :property
      t.string :status

      t.timestamps
    end
  end
end
