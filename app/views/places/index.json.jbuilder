json.array!(@places) do |place|
  json.extract! place, :id, :region_id, :name, :description
  json.url place_url(place, format: :json)
end
