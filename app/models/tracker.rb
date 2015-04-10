class Tracker < ActiveRecord::Base
  has_many :logs

  belongs_to :user
  belongs_to :profile
  belongs_to :campaign
  belongs_to :trackable

  has_one :provider, through: :trackable
  has_one :authentication, through: :profile

  acts_as_tenant :user

  validates_presence_of :profile
  validates_presence_of :campaign
  validates_presence_of :trackable

  def to_s
    "#{campaign}/#{provider}: #{profile.identifier} (#{trackable.type.to_s.titleize})"
  end
end
