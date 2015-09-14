json.array!(@schools) do |school|
  json.extract! school, :id, :school_name, :address, :phone_number, :email
  json.url school_url(school, format: :json)
end
