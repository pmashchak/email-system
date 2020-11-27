FactoryBot.define do
  factory :page_visit do
    host { Faker::Internet.domain_name }
    path { Faker::Internet.slug }
    association :user
  end
end
