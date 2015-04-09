require 'rails_helper'

RSpec.describe User, type: :model do
  it "returns an email address when converted to string" do
    user = create(:user, email: "personX@example.com")
    expect(user.to_s).to eq("personx@example.com")
  end

  it "sets up a new user as non-admin by default" do
    expect(User.new).not_to be_admin
  end

  # associations
  it { should have_many(:trackers) }
  it { should have_many(:campaigns) }
  it { should have_many(:authentications) }
  it { should have_many(:logs).through(:trackers) }
  it { should have_many(:tracked_profiles).through(:trackers).source(:profile) }
  it { should have_many(:authenticated_profiles).through(:authentications).source(:profile) }

  # validations
  it { should_not allow_value(nil).for(:admin) }
end
