feature "Activity Search Page" do
  scenario "should be displayed" do
    visit "/"
    click_link "Find Activities"
    expect(current_path).to eq(activities_path)
    expect(page).to have_content("Find Activities")
  end

  Capybara.javascript_driver = :selenium

  scenario "should have search navigation", js: :true do
    visit "/"
    click_link "Find Activities"
    expect(page).to have_link("Stay In")
    expect(page).to have_link("Go Out")
    expect(page).to have_link("Television")
    expect(page).to_not have_link("Sports")
  end

  scenario "should show hidden search items", js: :true do
    visit "/"
    click_link "Find Activities"
    click_link "Go Out"
    expect(page).to have_link("Sports")
    expect(page).to_not have_link("Television")
  end
  
end
