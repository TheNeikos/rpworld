json.array!(@users) do |api_user|
  json.extract! api_user, :id
  json.extract! api_user, :displayname
  json.url api_user_url(api_user, format: :json)
end
