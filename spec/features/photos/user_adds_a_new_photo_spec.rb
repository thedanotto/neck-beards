require "rails_helper"

feature "User add a new photo" do
  scenario "if he's logged in" do
    user = create(:user)
    sign_in(user)
    
    visit new_photo_path
    
    fill_in "Url", with: "http://i.imgur.com/FUsyxR5.jpg"
    fill_in "Caption", with: "A beautiful scene"
    click_button "Add photo"

    expect(page).to have_content("Successfully added new photo")
  end

  scenario "if he's logged out" do
    visit new_photo_path

    expect(page).to have_content("You must be signed in")
  end
end
