json.extract! applicant, :id, :name, :email, :password, :phone, :created_at, :updated_at
json.url applicant_url(applicant, format: :json)
