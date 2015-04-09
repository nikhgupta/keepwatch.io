require 'rails_helper'

RSpec.describe Campaign, type: :model do
  it "has a valid factory" do
    expect(build(:campaign)).to be_valid
  end

  it "requires a user as tenant" do
    ActsAsTenant.current_tenant = nil
    expect{ build(:campaign) }.to raise_error(ActsAsTenant::Errors::NoTenantSet)
  end

  it "returns name when converted to string" do
    campaign = create(:campaign, name: "CampaignX")
    expect(campaign.to_s).to eq("CampaignX")
  end

  # associations
  it { should belong_to(:user) }
  it { should have_many(:trackers) }
  it { should have_many(:profiles).through(:trackers) }
  it { should have_many(:trackables).through(:trackers) }
  it { should have_many(:providers).through(:trackables) }
  it { should have_many(:authentications).through(:trackers) }

  # validations
  it { should validate_presence_of(:name) }
end
