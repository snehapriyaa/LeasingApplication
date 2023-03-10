class Property < ApplicationRecord
  has_many :requests, dependent: :destroy
  has_many :waitlists, dependent: :destroy
  belongs_to :applicant, optional: true
end
