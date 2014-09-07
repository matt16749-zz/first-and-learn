FactoryGirl.define do
  factory :tag do
    name Faker::Commerce.department
    user_id 1
  end
end