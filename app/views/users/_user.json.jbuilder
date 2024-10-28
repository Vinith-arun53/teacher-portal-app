json.extract! user, :id, :u_name, :u_user_name, :password, :created_at, :updated_at
json.url user_url(user, format: :json)
