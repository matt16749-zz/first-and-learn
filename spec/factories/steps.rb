FactoryGirl.define do
  factory :step do
    body          Faker::Lorem.paragraph
    position      1
    path_id       1
    asset_id      1
  end
end
