require 'rails_helper'

RSpec.describe Provider, type: :model do
  it "has a valid factory" do
    expect(build(:provider)).to be_valid
  end

  it "does not require a user as tenant" do
    ActsAsTenant.current_tenant = nil
    expect{ build(:provider) }.not_to raise_error
  end

  it "returns name when converted to string" do
    provider = create(:provider, name: "ProviderX")
    expect(provider.to_s).to eq("ProviderX")
  end

  # associations
  it { should have_many(:profiles) }
  it { should have_many(:trackables) }
  it { should have_many(:trackers).through(:trackables) }
  it { should have_many(:authentications).through(:profiles) }
  it { should have_many(:users).through(:trackers) }
  it { should have_many(:campaigns).through(:trackers) }

  # validations
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
end
