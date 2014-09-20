feature "User Dashboard" do

  before do
    @user = Fabricate(:user)
  end

  scenario "should be displayed with " do
    skip

    visit "/"
    click_link "Log In"
    fill_in "Email", with: "#{@user.email}"
    fill_in "Password", with: "#{@user.password}"
    click_button "Log in"
    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Welcome back, #{@user.first_name} #{@user.last_name}!")
  end
end
