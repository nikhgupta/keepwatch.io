require 'rails_helper'

RSpec.describe Trackable, type: :model do
  it "has a valid factory" do
    expect(build(:trackable)).to be_valid
  end

  it "does not require a user as tenant" do
    ActsAsTenant.current_tenant = nil
    expect{ build(:trackable) }.not_to raise_error
  end

  it "returns trackable information when converted to string" do
    provider  = create(:provider, name: "ProviderX")
    trackable = create(:trackable, provider: provider, type: "BasicStatistics")
    expect(trackable.to_s).to eq("ProviderX (Basic Statistics)")
  end

  it { should belong_to(:provider) }
  it { should have_many(:trackers) }
  it { should have_many(:users).through(:trackers) }
  it { should have_many(:campaigns).through(:trackers) }
  it { should have_many(:profiles).through(:trackers) }
  it { should have_many(:authentications).through(:profiles) }
end
