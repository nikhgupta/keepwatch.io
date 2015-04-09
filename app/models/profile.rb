class Profile < ActiveRecord::Base
  belongs_to :provider
  has_many   :trackers
  has_one    :authentication

  has_many   :campaigns, through: :trackers
  has_many   :trackables, through: :provider
  has_one    :user, through: :authentication

  validates_presence_of :provider
  validates_presence_of  :identifier

  def to_s
    "#{provider}: #{identifier}"
  end
end
