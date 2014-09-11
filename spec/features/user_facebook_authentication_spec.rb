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
    expect(page).to     have_content("Sign In with Facebook")
    User.where(
      email: "joesmith@example.com",
      facebook_uid: "12345",
      facebook_username: "joe",
      name: "Joe Smith",
      github_access_token: ENV["FACEBOOK_ACCESS_TOKEN"],
    ).count.should == 1
    User.count.should == 1
  end

  scenario "Student can log in and log out with Facebook" do
    Fabricate(:user,
      facebook_uid: "12345",
      email: "joe@example.com",
      facebook_username: "joe")
    sign_into_facebook_as "joe"
    visit "/"
    click_link "Sign In with Facebook"
    expect(page).to     have_content("Successfully authenticated from Facebook account.")
    expect(page).to     have_content("Sign Out")
    expect(page).to_not have_content("Sign In")
    click_link "Sign Out"
    expect(page).to_not have_content("Sign Out")
    expect(page).to     have_content("Sign In with Github")
    User.count.should == 1
  end

end
