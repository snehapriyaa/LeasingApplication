class Applicant < ApplicationRecord
  has_secure_password
  has_many :requests
  has_many :waitlists
  has_one :property
  validates :email, presence: true, uniqueness: true
  def self.find_or_create_from_auth_hash(auth)
    where(name: auth.info.first_name, email: auth.info.email).first_or_initialize.tap do |applicant|
      applicant.name = auth.info.first_name
      applicant.email = auth.info.email
      applicant.phone = "87878"
      applicant.password = (0...8).map { (65 + rand(26)).chr }.join.to_s
      applicant.save!
    end
  end
end
