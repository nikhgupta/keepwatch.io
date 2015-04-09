class Trackable < ActiveRecord::Base
  has_many :trackers
  belongs_to :provider

  has_many :users, through: :trackers
  has_many :campaigns, through: :trackers
  has_many :profiles, through: :trackers
  has_many :authentications, through: :profiles

  def to_s
    "#{provider} (#{type.titleize})"
  end
end

class BasicStatistics < Trackable
end
