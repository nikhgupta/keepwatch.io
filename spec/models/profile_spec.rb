require 'rails_helper'

RSpec.describe Profile, type: :model do
  it "has a valid factory" do
    expect(build(:profile)).to be_valid
  end

  it "does not require a user as tenant" do
    ActsAsTenant.current_tenant = nil
    expect{ build(:profile) }.not_to raise_error
  end

  it "returns profile information when converted to string" do
    provider = create(:provider, name: "ProviderX")
    profile  = create(:profile, provider: provider, identifier: "IdentifierX")
    expect(profile.to_s).to eq("ProviderX: IdentifierX")
  end

  # associations
  it { should belong_to(:provider) }
  it { should have_many(:trackers) }
  it { should have_one(:authentication) }
  it { should have_one(:user).through(:authentication) }
  it { should have_many(:campaigns).through(:trackers) }
  it { should have_many(:trackables).through(:provider) }

  # validations
  it { should validate_presence_of(:provider) }
  it { should validate_presence_of(:identifier) }
end
