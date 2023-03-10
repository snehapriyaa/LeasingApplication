class Deletewaitlistspropertyandapplicant < ActiveRecord::Migration[6.1]
  def change
    remove_column :waitlists, :property_id, :integer
    remove_column :waitlists, :applicant, :integer
  end
end
