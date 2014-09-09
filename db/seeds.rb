comment_ids = 200
path_ids = 5
asset_ids = 200
tag_ids = 100
step_ids = 100
user_ids = 20
vote_ids = 500

user_ids.times do
  User.create(
                first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                email: Faker::Internet.email,
                password: 'password'
    )
end

path_ids.times do |path_index|
  path = Path.create(
                title: Faker::Lorem.sentence,
                description: Faker::Lorem.paragraph,
                user_id: rand(1..user_ids)
    )

  5.times do |step_index|
    path.steps.create(
                body: Faker::Hacker.say_something_smart,
                position: step_index + 1,
                path_id: path_index + 1,
                asset_id: rand(1..asset_ids)
    )
  end
end

asset_ids.times do
  type = ['book', 'video', 'tutorial', 'event', 'practice', 'other']
  Asset.create(
                    title: Faker::Lorem.sentence,
                    description: Faker::Lorem.paragraph,
                    url: Faker::Internet.url,
                    asset_type: type.sample,
                    user_id: rand(1..user_ids)
    )
end

comment_ids.times do
  type = ['Path', 'Asset'].sample
  id = type == 'Path' ? path_ids : asset_ids
  Comment.create(
                  body: Faker::Lorem.paragraph,
                  user_id: rand(1..user_ids),
                  commentable_id: rand(1..id),
                  commentable_type: type
    )
end

vote_ids.times do
  type = ['Path', 'Asset'].sample
  id = type == 'Path' ? path_ids : asset_ids
  Vote.create(
                vote_state: [true, false].sample,
                user_id: rand(1..user_ids),
                voteable_id: rand(1..id),
                voteable_type: type
    )
end
