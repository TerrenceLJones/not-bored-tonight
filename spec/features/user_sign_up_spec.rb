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

feature "Users signs up" do
  scenario "Happy Path, Sign Up and subsequently Sign In" do
    visit '/'
    click_link "Sign Up"
    fill_in "Email", with: "todd@example.com"
    fill_in "Password", with: "password1"
    click_button "Create My Account"
    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Welcome to Not Bored Tonight, todd@example.com!")
    expect(page).to_not have_content("Sign Up")
    expect(page).to_not have_content("Sign In")
  end
end
