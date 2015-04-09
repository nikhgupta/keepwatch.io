FactoryGirl.define do
  factory :authentication do
    profile
    token "TOKEN"
    secret "SECRET"
    type "APIAuthentication"
  end
end
