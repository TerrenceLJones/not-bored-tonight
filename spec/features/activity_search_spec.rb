feature "Activity Search Page" do
  scenario "should be displayed" do
    visit "/"
    click_link "Find Activities"
    expect(current_path).to eq(activities_path)
    expect(page).to have_content("Find Activities")
  end

  scenario "should have search navigation" do
    visit "/"
    click_link "Find Activities"
    expect(page).to have_css(".search-container__navigation")
    expect(page).to have_link("Sports")
    expect(page).to have_link("Food")
  end

  scenario "should show search results", js: :true do
    pending
    visit "/"
    click_link "Find Activities"
    fill_in 'search-location', with: "37215"
    select '10', from: "search-radius"
    select 'Next Week', from: "search-date"
    click_link "Sport"
    expect(find(".search-container__search-results")).to have_content("Title")
    expect(page).to have_css(".search-results__sports")
  end

end
