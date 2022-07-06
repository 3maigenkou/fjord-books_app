# frozen_string_literal: true

class DailyReport < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  validates :title, presence: true
  validates :content, presence: true
end
