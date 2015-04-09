class Provider < ActiveRecord::Base
  has_many :profiles
  has_many :trackables

  has_many :authentications, through: :profiles
  has_many :trackers, through: :trackables
  has_many :campaigns, through: :trackers
  has_many :users, through: :trackers

  validates :name, presence: true, uniqueness: true

  def to_s
    name
  end
end
