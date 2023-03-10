class AddFkeysToWaitlists < ActiveRecord::Migration[6.1]
  def change
    add_reference :waitlists, :property, null: false, foreign_key: true
    add_reference :waitlists, :applicant, null: false, foreign_key: true
  end
end
