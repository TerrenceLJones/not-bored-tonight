feature "Home Page" do
  scenario "is displayed when loading the site" do
    visit '/'
    expect(page).to have_content("Not Bored Tonight")
  end
end
