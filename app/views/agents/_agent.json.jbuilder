json.extract! agent, :id, :name, :email, :password, :phone, :created_at, :updated_at
json.url agent_url(agent, format: :json)
