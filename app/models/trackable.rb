class Trackable < ActiveRecord::Base
  has_many :trackers
  belongs_to :provider, counter_cache: true

  has_many :users, through: :trackers
  has_many :campaigns, through: :trackers
  has_many :profiles, through: :trackers
  has_many :authentications, through: :profiles

  def to_s
    "#{provider} (#{type.to_s.titleize})"
  end

  def self.policy_class
    TrackablePolicy
  end
end

class BasicStatistics < Trackable
end
