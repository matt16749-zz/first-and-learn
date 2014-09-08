FactoryGirl.define do
  factory :vote do
    vote_state    [true, false].sample
    voteable_type ['Path', 'Asset'].sample
    voteable_id   1
    user_id       1
  end
end
