class AddKeysToRequests < ActiveRecord::Migration[6.1]
  def change
    add_reference :requests, :property, null: false, foreign_key: true
    add_reference :requests, :applicant, null: false, foreign_key: true
  end
end
