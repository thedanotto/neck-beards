FactoryGirl.define do
  factory :photo do
    user
    url "http://i.imgur.com/FUsyxR5.jpg"
    caption "Mountains"
  end

  factory :timeline do
  end

  factory :user do
    email "joe.soap@example.com"
    password_digest "my_secret"
  end
end
