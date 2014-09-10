# As a new user
# I would like the ability to create a new account
# so that I can fully use the site.
#
# Acceptance Criteria
#
#   * Can successfully create a new account with the following attributes
  #     * first_name
  #     * last_name
  #     * username
  #     * email
  #     * password
  #     * location
#   * Error should be displayed when user attempts to create account with a
#     duplicate username or email
#   * Account information should be present in database.

feature "User signs up" do
  scenario "and successfully creates an account" do
    visit '/'
    click_link "Sign Up"
    fill_in "First Name", with: "Todd"
    fill_in "Last Name", with: "Peters"
    fill_in "Email", with: "todd@example.com"
    fill_in "Password", with: "password1"
    click_button "Create My Account"
    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Welcome to Not Bored Tonight, Todd Peters!")
    expect(page).to_not have_content("Sign Up")
    expect(page).to_not have_content("Sign In")

    click_link("Sign Out")

    expect(current_path).to eq(new_user_session_path)
    fill_in "Email", with: "todd@example.com"
    fill_in "Password", with: "password1"
    click_button "Log in"
    expect(page).to have_content("Welcome back, Todd Peters!")
  end

  scenario "with an email already in use" do
    visit '/'
    click_link "Sign Up"
    fill_in "First Name", with: "Todd"
    fill_in "Last Name", with: "Peters"
    fill_in "Email", with: "todd@example.com"
    fill_in "Password", with: "password1"
    click_button "Create My Account"

    click_link("Sign Out")
    expect(current_path).to eq(new_user_session_path)

    click_link "Sign Up"
    fill_in "First Name", with: "Todd"
    fill_in "Last Name", with: "Peters"
    fill_in "Email", with: "todd@example.com"
    fill_in "Password", with: "password1"
    click_button "Create My Account"
    expect(page).to have_content("has already been taken")
  end

  scenario "without filling in required credentials" do
    visit '/'
    click_link "Sign Up"
    fill_in "First Name", with: "Todd"
    fill_in "Last Name", with: "Peters"
    click_button "Create My Account"
    expect(page).to have_content("can't be blank")
    expect(page).to have_content("can't be blank")
  end

end
