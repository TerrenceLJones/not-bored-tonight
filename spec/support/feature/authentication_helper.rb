module Features
  module AuthenticationHelpers

    def sign_into_facebook_as(user_or_username, token: nil)
      if user_or_username.is_a? User
        user = user_or_username
      end

      token = user_or_username.try(:facebook_access_token) || token || ENV["FACEBOOK_ACCESS_TOKEN"]
      username = user_or_username.try(:Facebook_username) || user_or_username
      uid = user_or_username.try(:facebook_uid) || '12345'
      email = user.try(:email) || "#{username}smith@example.com"

      # photo_url = "http://graph.facebook.com/#{uid}/picture?type=square"
      # @default_image ||= File.read(Rails.root.join('spec', 'support', 'files', 'cartoon-ninja.jpeg'))
      #
      # stub_request(:get, photo_url).
      #   to_return( body: @default_image,
      #             :status   => 200,
      #             :headers  => { 'Content-Type' => "image/jpeg; charset=UTF-8" } )

      OmniAuth.config.test_mode = true
      OmniAuth.config.add_mock(:facebook, {
        uid: uid,
        credentials: {
          token: token
        },
        info: {
          nickname: username,
          email: email,
          name: "#{username.capitalize} Smith",
          # image: photo_url,
        }
      })
    end
  end
end

RSpec.configure do |config|
  config.include Features::AuthenticationHelpers, type: :feature
end
