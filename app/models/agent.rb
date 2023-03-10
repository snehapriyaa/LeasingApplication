class Agent < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  def self.find_or_create_from_auth_hash(auth)
    where(name: auth.info.first_name, email: auth.info.email).first_or_initialize.tap do |agent|
      agent.name = auth.info.first_name
      agent.email = auth.info.email
      agent.phone = "87878"
      agent.password = (0...8).map { (65 + rand(26)).chr }.join.to_s
      agent.save!
    end
  end
end
