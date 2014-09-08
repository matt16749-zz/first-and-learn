FactoryGirl.define do
  factory :comment do
    body  Faker::Lorem.sentence
    commentable_id 1
  end
end
