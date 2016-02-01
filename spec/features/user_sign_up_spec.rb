require "rails_helper"

# As a user, I should be able to register with email:
#  - Choose a unique username.
#  - Provide a full name.
#  - Provide a short bio (max length: 140 characters).
feature "User signs up" do
  scenario "with email and password" do
    visit new_user_path

    fill_in "Full name", with: "Some One"
    fill_in "Email", with: "someone@gmail.com"
    fill_in "Password", with: "aFreakinPassword"
    click_button "Sign up"

    expect(page).to have_content("Successfully signed up")
  end

  scenario "with username, email, password, full name and bio" do
    visit new_user_path

    fill_in "Username", with: "someone"
    fill_in "Email", with: "someone@gmail.com"
    fill_in "Password", with: "aFreakinPassword"
    fill_in "Full name", with: "Yukihiro Matsumoto"
    fill_in "Bio", with: "I'm nice"
    click_button "Sign up"

    expect(page).to have_content("Successfully signed up")
  end
end

feature "Usernames are unique" do
  scenario "tries to sign up with an existing username" do
    create :user, username: "epi"
    visit new_user_path

    fill_in "Username", with: "epi"
    fill_in "Password", with: "anotherPassword"
    click_button "Sign up"

    expect(page).to have_content("Username has already been taken")
  end
end
