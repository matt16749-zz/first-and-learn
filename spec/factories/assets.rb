FactoryGirl.define do
  factory :asset do
    title         Faker::Lorem.sentence
    description   Faker::Lorem.paragraph
    url           Faker::Internet.url
    user_id       1
  end
end
