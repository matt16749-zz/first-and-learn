FactoryGirl.define do
  factory :path do
    title Faker::Name.title
    description Faker::Lorem.paragraph
    user_id 1
  end
end
