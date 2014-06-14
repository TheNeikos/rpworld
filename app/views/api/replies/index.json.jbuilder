json.array!(@replies) do |reply|
  json.extract! reply, :id, :place_id, :user_id, :character_id, :body
  json.url reply_url(reply, format: :json)
end
