FactoryGirl.define do
  factory :tag do
    name Faker::Lorem.word
    user_id 1
  end
end
