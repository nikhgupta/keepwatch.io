FactoryGirl.define do
  factory :profile do
    provider
    sequence(:identifier){ |n| "Identifier#{n}" }
  end
end
