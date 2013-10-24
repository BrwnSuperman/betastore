json.array!(@password_resets) do |password_reset|
  json.extract! password_reset, 
  json.url password_reset_url(password_reset, format: :json)
end
