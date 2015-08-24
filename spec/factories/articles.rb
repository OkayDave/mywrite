require 'faker'

FactoryGirl.define do
  factory :article do
    author  { Faker::Name.name }
    subject { Faker::Lorem.sentence }
    body    { "test *test* **test**" }
  end


end
