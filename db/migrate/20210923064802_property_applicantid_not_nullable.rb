class PropertyApplicantidNotNullable < ActiveRecord::Migration[6.1]
  def change
    change_column_null :properties, :applicant_id, true
  end
end
