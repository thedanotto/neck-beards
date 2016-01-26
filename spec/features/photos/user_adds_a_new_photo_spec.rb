require "rails_helper"

feature "Add new photo" do
  scenario "a user adds a photo" do
    user = create(:user)
    sign_in(user)
    
    visit new_photo_path
    fill_in "Url", with: "http://i.imgur.com/FUsyxR5.jpg"
    fill_in "Caption", with: "A beautiful scene"
    click_button "Add photo"

    expect(page).to have_content("Successfully added new photo")
  end

  scenario "guest tries to add a photo" do
    visit new_photo_path

    expect(page).to have_content("You need to sign in or sign up")
  end
end
