class User < ActiveRecord::Base
  has_many :trackers
  has_many :campaigns
  has_many :authentications

  has_many :logs, through: :trackers

  has_many :tracked_profiles, through: :trackers, source: :profile
  has_many :authenticated_profiles, through: :authentications, source: :profile

  validates_inclusion_of :admin, in: [true, false], allow_nil: false

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def to_s
    email
  end
end
