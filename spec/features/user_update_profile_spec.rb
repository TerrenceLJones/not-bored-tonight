# Edit Account Information
#
# Story
#
# As a user I would like the ability update my account information so that I can
# change any inaccurate information.
#
# Acceptance Criteria
#
#  * Database is updated with updated user information

feature "Users updates profile information" do

  before do
    @user = Fabricate(:user)
  end

  scenario "successufly updates first and last name" do
    visit "/"
    click_link "Sign In"
    fill_in "Email", with: "#{@user.email}"
    fill_in "Password", with: "#{@user.password}"
    click_button "Log in"
    expect(page).to have_content("Edit Profile")

    click_link "Edit Profile"
    expect(current_path).to eq(edit_user_registration_path)

    fill_in "First Name", with: "John"
    fill_in "Last Name", with: "Doe"
    fill_in "Current password", with: "#{@user.password}"
    click_button "Update Account"
    expect(current_path).to eq(dashboard_path)
  end

  scenario "successfully updates email" do
    visit "/"
    click_link "Sign In"
    fill_in "Email", with: "#{@user.email}"
    fill_in "Password", with: "#{@user.password}"
    click_button "Log in"
    expect(page).to have_content("Edit Profile")

    click_link "Edit Profile"
    expect(current_path).to eq(edit_user_registration_path)

    fill_in "Email", with: "job@example.com"
    fill_in "Current password", with: "#{@user.password}"
    click_button "Update Account"
    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Your account has been successfully updated!")
  end

  scenario "successfully updates password" do
    visit "/"
    click_link "Sign In"
    fill_in "Email", with: "#{@user.email}"
    fill_in "Password", with: "#{@user.password}"
    click_button "Log in"
    expect(page).to have_content("Edit Profile")

    click_link "Edit Profile"
    expect(current_path).to eq(edit_user_registration_path)

    fill_in "Password", with: "password1"
    fill_in "Password confirmation", with: "password1"
    fill_in "Current password", with: "#{@user.password}"
    click_button "Update Account"
    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Your account has been successfully updated!")
  end

  scenario "without confirming password" do
    visit '/'
    click_link "Sign In"
    fill_in "Email", with: "#{@user.email}"
    fill_in "Password", with: "#{@user.password}"
    click_button "Log in"
    expect(page).to have_content("Edit Profile")

    click_link "Edit Profile"
    expect(current_path).to eq(edit_user_registration_path)

    fill_in "Password", with: "password1"
    fill_in "Current password", with: "#{@user.password}"
    click_button "Update Account"
    expect(page).to have_content("doesn't match")
  end

  scenario "without putting current password to complete update" do
    visit '/'
    click_link "Sign In"
    fill_in "Email", with: "#{@user.email}"
    fill_in "Password", with: "#{@user.password}"
    click_button "Log in"
    expect(page).to have_content("Edit Profile")

    click_link "Edit Profile"
    expect(current_path).to eq(edit_user_registration_path)

    fill_in "Password", with: "password1"
    fill_in "Password confirmation", with: "password1"
    click_button "Update Account"
    expect(page).to have_content("can't be blank")
  end

end
