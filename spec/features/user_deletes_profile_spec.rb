feature "User Deletes profile" do

  before do
    @user = Fabricate(:user)
  end

  scenario "Happy path" do
    visit '/'
    click_link "Log In"
    fill_in "Email", with: "#{@user.email}"
    fill_in "Password", with: "#{@user.password}"
    click_button "Log in"
    expect(page).to have_content("Edit Profile")

    click_link "Edit Profile"
    expect(current_path).to eq(edit_user_registration_path)
    click_link "Cancel my account"
    expect(current_path).to eq(new_user_session_path)
    expect(page).to have_content("Bye! Your account has been successfully cancelled. We hope to see you again soon.")
  end
end
