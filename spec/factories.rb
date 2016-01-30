FactoryGirl.define do
  factory :photo do
    user
    url "http://i.imgur.com/FUsyxR5.jpg"
    caption "Mountains"
  end

  factory :timeline do
  end

  factory :user do
    username "doctorwho"
    password_digest "doctorwho"
    full_name "Doctor Who?"
    email "doctor@who.com"
    bio "Doctor Who is a British science-fiction television programme produced by the BBC from 1963 to the present day."
  end
end
