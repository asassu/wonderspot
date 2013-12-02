json.array!(@users) do |user|
  json.extract! user, :name, :email, :description, :interests, :quotes
  json.url user_url(user, format: :json)
end