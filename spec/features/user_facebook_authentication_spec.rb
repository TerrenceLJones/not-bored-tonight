# Story
#
# As a user,
# I would like the ability to sign up to use the site with my Facebook account
# so that I don't have to create new credentials.
#
# Acceptance Criteria
#
#  * Successfully create account with Facebook credentials
#  * Associated Facebook credentials with existing account, if user has already
#  created an account with email and password

feature "Facebook authentication" do

  scenario "User signs up via. Facebook" do
    sign_into_facebook_as "joe"
    visit "/"
    click_link "Sign in with Facebook"
    expect(page).to     have_content("Successfully authenticated from Facebook account.")
    expect(page).to     have_content("Sign Out")
    expect(page).to_not have_content("Sign In")
    click_link "Sign Out"
    expect(page).to_not have_content("Sign Out")
    expect(page).to     have_content("Sign in with Facebook")
    expect(User.count).to eq 1
  end

  scenario "Student can log in and log out with Facebook" do
    Fabricate(:user,
      uid: "12345",
      email: "joe@example.com",
      # name: "joe"
      )
    sign_into_facebook_as "joe"
    visit "/"
    click_link "Sign in with Facebook"
    expect(page).to     have_content("Successfully authenticated from Facebook account.")
    expect(page).to     have_content("Sign Out")
    expect(page).to_not have_content("Sign In")
    click_link "Sign Out"
    expect(page).to_not have_content("Sign Out")
    expect(page).to     have_content("Sign in with Facebook")
    expect(User.count).to eq 2
  end

end
