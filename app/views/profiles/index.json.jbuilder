json.array!(@profiles) do |profile|
  json.extract! profile, :id, :user_id, :name, :date_of_birth, :city, :about_me, :user_type
  json.url profile_url(profile, format: :json)
end
