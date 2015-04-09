FactoryGirl.define do
  factory :user do
    admin false
    sequence(:email) {|n| "person#{n}@example.com" }
    password "password"
    password_confirmation "password"
  end

  factory :admin, parent: :user do
    admin true
  end
end
