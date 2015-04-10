puts "Seeding.."

admin = User.create!( email: 'admin@example.com', password: 'password', password_confirmation: 'password', admin: true)
user  = User.create!( email: 'test@example.com', password: 'password', password_confirmation: 'password')
providers = Hash[%w[Facebook Twitter].map{ |name| [name.underscore.to_sym, Provider.find_or_create_by(name: name)] }]
trackables = Hash[providers.map{|k,r| [k, r.trackables.create(type: "BasicStatistics", auth_dependent: "API")]}]

ActsAsTenant.with_tenant(admin) do
  campaign = Campaign.find_or_create_by(name: "Admin Campaign")
  profile  = providers[:facebook].profiles.create identifier: "nikhgupta"

  Tracker.create profile: profile, campaign: campaign, trackable: trackables[:facebook]
end

ActsAsTenant.with_tenant(user) do
  campaign = Campaign.find_or_create_by(name: "User Campaign")
  profile  = providers[:facebook].profiles.create identifier: "nikunj.bansal.88"

  Tracker.create profile: profile, campaign: campaign, trackable: trackables[:facebook]
end

puts "Finished.."
