json.extract! admin, :id, :name, :email, :phone, :password, :created_at, :updated_at
json.url admin_url(admin, format: :json)
