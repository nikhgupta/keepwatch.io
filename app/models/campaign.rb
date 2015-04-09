class Campaign < ActiveRecord::Base
  belongs_to :user
  has_many :trackers
  has_many :profiles,        through: :trackers
  has_many :trackables,      through: :trackers
  has_many :authentications, through: :trackers
  has_many :providers,       through: :trackables

  acts_as_tenant :user

  validates_presence_of :user
  validates_presence_of :name
  validates_uniqueness_to_tenant :name

  def to_s
    name
  end
end
