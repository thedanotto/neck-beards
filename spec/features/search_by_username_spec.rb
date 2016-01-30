require "rails_helper"

feature "Search by username" do
  scenario "finding matching users" do
    given_we_have_these_users %w(anthony patrick jesus matthew daniel)
    and_we_search_the_term "thony"
    then_the_page_should_contain_user "anthony"
  end

  scenario "ignoring not matching users" do
    given_we_have_these_users %w(anthony patrick jesus matthew daniel)
    and_we_search_the_term "thony"
    then_the_page_should_not_contain_user "patrick"
  end

  def given_we_have_these_users(usernames)
    usernames.each do |username|
      create :user,
             username: username,
             email: "#{username}@acme.com"
    end
  end

  def and_we_search_the_term(term)
    visit root_path(as: any_user)
    fill_in "Search by username", with: term
    click_button "Search"
  end

  def then_the_page_should_contain_user(username)
    expect(page).to have_content(username)
  end

  def then_the_page_should_not_contain_user(username)
    expect(page).not_to have_content(username)
  end

  def any_user
    User.first || create(:user)
  end
end
