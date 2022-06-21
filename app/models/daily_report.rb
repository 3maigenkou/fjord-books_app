class DailyReport < ApplicationRecord
  belongs_to :following, class_name: 'User'
end
