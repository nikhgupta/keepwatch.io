require 'rails_helper'

RSpec.describe Authentication, type: :model do
  it "has a valid factory" do
    expect(build(:authentication)).to be_valid
  end

  it "requires a user as tenant" do
    ActsAsTenant.current_tenant = nil
    expect{ build(:authentication) }.to raise_error(ActsAsTenant::Errors::NoTenantSet)
  end

  it "returns provider and profile information when converted to string" do
    prov = create(:provider, name: "ProviderX")
    prof = create(:profile,  provider: prov, identifier: "IdentifierX")
    auth = create(:authentication, profile: prof)
    expect(auth.to_s).to eq("ProviderX: IdentifierX [API]")
  end

  # associations
  it { should belong_to(:user) }
  it { should belong_to(:profile) }
  it { should have_one(:provider).through(:profile) }
  it { should have_many(:trackers).through(:profile) }
  it { should have_many(:trackables).through(:provider) }
  it { should have_many(:campaigns).through(:trackers) }

  # validations
  it { should validate_presence_of(:type) }
  it { should validate_presence_of(:token) }
  it { should validate_presence_of(:secret) }
  it { should validate_presence_of(:profile) }

  xit "does not allow an authentication to belong to multiple users"
end
