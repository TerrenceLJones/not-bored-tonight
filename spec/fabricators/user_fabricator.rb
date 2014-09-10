Fabricator(:user) do
  first_name{ sequence(:first_name) { |i| "user_first_name#{i}" } }
  last_name { sequence(:last_name) { |i| "user_last_name#{i}" } }
  email { sequence(:email) { |i| "user#{i}@example.com" } }
  password { "password1" }
end
