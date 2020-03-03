require 'zodiac'

class User < ApplicationRecord
  has_secure_password

  validates :password, presence: true, if: :setting_password?
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  has_many :following_users, foreign_key: "follower_id", dependent: :destroy
  has_many :follower_users, class_name: "FollowingUser", foreign_key: "following_id", dependent: :destroy
  has_many :followers, class_name: "User", through: :follower_users, foreign_key: "follower_id"
  has_many :following, class_name: "User", through: :following_users, foreign_key: "following_id"

  has_many :notifications

  def setting_password?
    password || password_confirmation
  end

  def zodiac_setter
    bday = self.birthday.split("/")
    m = bday[0].to_i
    d = bday[1].to_i
    y = bday[2].to_i
    self.zodiac = Date.new(y, m, d).zodiac_sign
    # self.save!
  end

end
