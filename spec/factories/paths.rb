FactoryGirl.define do
  factory :path do
    title Faker::Name.title
    description Faker::Lorem.paragraph
    user_id rand(1..10).sample
  end
end
