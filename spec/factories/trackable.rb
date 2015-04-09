FactoryGirl.define do
  factory :trackable do
    provider
    type "BasicStatistics"
    auth_dependent false
  end
end
