comment_ids = 200
path_ids = 30
resource_ids = 200
tag_ids = 100
takeaway_ids = 100
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

path_ids.times do
  Path.create(
                title: Faker::Lorem.sentence,
                description: Faker::Lorem.paragraph,
                user_id: rand(1..user_ids)
    )
end

resource_ids.times do
  Resource.create(
                    title: Faker::Lorem.sentence,
                    description: Faker::Lorem.description,
                    url: Faker::Internet.url,
                    user_id: rand(1..user_ids)
    )
end

takeaway_ids.times do
  Takeaway.create(
                    body: Faker::Hacker.say_something_smart,
                    path_id: rand(1..path_ids),
                    resource_id: rand(1..resource_ids)
    )
end

tag_ids.times do
  Tag.create(
              type: Faker::Lorem.word,
              path_id: rand(1..path_ids),
              resource_id: rand(1..resource_ids)
    )
end

comment_ids.times do
  type = ['paths', 'resources'].sample
  id = type == 'paths' ? path_ids : resource_ids
  Comment.create(
                  body: Faker::Lorem.paragraph,
                  user_id: rand(1..user_ids),
                  commentable_id: rand(1..id),
                  commentable_type: type
    )
end

vote_ids.times do
  type = ['paths', 'resources'].sample
  id = type == 'paths' ? path_ids : resource_ids
  Vote.create(
                state: [true, false].sample,
                user_id: rand(1..user_ids),
                voteable_id: rand(1..id),
                voteable_type: type
    )
end
