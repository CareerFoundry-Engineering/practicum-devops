
FactoryBot.define do
  factory :user do
    name { Faker::Name.name_with_middle }
    ocupation { Faker::Job.title }
    email { Faker::Internet.free_email }
    bio { Faker::Games::WorldOfWarcraft.quote }
    uuid { Faker::Internet.uuid }
    avatar_url { Faker::Avatar.unique.image }
  end
end
