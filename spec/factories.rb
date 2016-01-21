FactoryGirl.define do
  factory :photo do
    user
    url "http://img1.sunset.timeinc.net/sites/default/files/image/2010/06/stanley-lake-0610-x.jpg"
    caption "Mountains and a lake"
  end

  factory :timeline do
  end

  factory :user do
  end
end
