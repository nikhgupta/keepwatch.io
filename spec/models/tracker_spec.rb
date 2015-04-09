require 'rails_helper'

RSpec.describe Tracker, type: :model do
  it "has a valid factory" do
    expect(build(:tracker)).to be_valid
  end

  it "requires a user as tenant" do
    ActsAsTenant.current_tenant = nil
    expect{ build(:tracker) }.to raise_error(ActsAsTenant::Errors::NoTenantSet)
  end

  it "returns tracker information when converted to string" do
    campaign  = create(:campaign, name: "CampaignX")
    provider  = create(:provider, name: "ProviderX")
    profile   = create(:profile,  provider: provider, identifier: "IdentifierX")
    trackable = create(:trackable, provider: provider)
    tracker   = create(:tracker, campaign: campaign, profile: profile, trackable: trackable)

    expect(tracker.to_s).to eq("CampaignX/ProviderX: IdentifierX (Basic Statistics)")
  end

  # associations
  it { should have_many(:logs) }
  it { should belong_to(:user) }
  it { should belong_to(:profile) }
  it { should belong_to(:campaign) }
  it { should belong_to(:trackable) }
  it { should have_one(:provider).through(:trackable) }
  it { should have_one(:authentication).through(:profile) }

  # validations
  it { should validate_presence_of(:profile) }
  it { should validate_presence_of(:campaign) }
  it { should validate_presence_of(:trackable) }
end
