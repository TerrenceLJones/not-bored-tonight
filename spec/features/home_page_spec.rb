feature "Nav_bar" do
  scenario "when logged out" do
    visit '/'
    expect(page).to have_content("Not Bored Tonight")
  end
end
