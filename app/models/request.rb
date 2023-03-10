class Request < ApplicationRecord
  # enum status: {pending: 0, accepted: 1, rejected: 2}
  belongs_to :applicant
  belongs_to :property
end
