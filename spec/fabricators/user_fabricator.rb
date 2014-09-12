Fabricator(:user) do
  uid { sequence(:uid, 12345).to_s }
  first_name { sequence(:first_name) { |i| "user_first_name#{i}" } }
  last_name { sequence(:last_name) { |i| "user_last_name#{i}" } }
  email { sequence(:email) { |i| "user#{i}@example.com" } }
  password { "password1" }
end
