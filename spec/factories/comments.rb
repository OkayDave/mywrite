require 'faker'

FactoryGirl.define do
  factory :comment do
    author { Faker::Name.name }
    body   { Faker::Lorem.paragraph}
    article
  end

end
