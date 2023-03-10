class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :address
      t.date :start_date
      t.float :fee
      t.float :rent
      t.boolean :pets_allowed
      t.boolean :in_unit_laundry
      t.boolean :parking
      t.string :terms_available

      t.timestamps
    end
  end
end
