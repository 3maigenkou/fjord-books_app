# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :active_relationships, class_name: 'FollowRelationship',
                                  foreign_key: 'follower_id',
                                  dependent: :destroy,
                                  inverse_of: :follower
  has_many :passive_relationship, class_name: 'FollowRelationship',
                                  foreign_key: 'followed_id',
                                  dependent: :destroy,
                                  inverse_of: :followed

  has_many :followings, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationship, source: :follower

  scope :order_id, -> { with_attached_avatar.order(:id) }

  def follow(user_id)
    active_relationships.create!(followed_id: user_id)
  end

  def unfollow(user_id)
    active_relationships.find_by!(followed_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end
end
