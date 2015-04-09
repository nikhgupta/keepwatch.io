class Authentication < ActiveRecord::Base
  belongs_to :user
  belongs_to :profile
  has_many   :trackers,   through: :profile
  has_many   :campaigns,  through: :trackers
  has_many   :trackables, through: :provider
  has_one    :provider,   through: :profile

  acts_as_tenant :user

  validates_presence_of :user
  validates_presence_of :profile

  validates_presence_of :type
  validates_presence_of :token
  validates_presence_of :secret

  def to_s
    "#{profile} [#{type.to_s.gsub(/Authentication$/, '')}]"
  end
end

class APIAuthentication < Authentication
end
