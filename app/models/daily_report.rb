class DailyReport < ApplicationRecord
  belongs_to :user
  validates :comment, as: :commentable, dependent: :destroy
  validates :title, presence: true
  validates :content, presence: true
end
