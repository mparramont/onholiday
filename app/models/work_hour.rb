class WorkHour < ActiveRecord::Base
  validates :hour, presence: true
  validates :day, presence: true
  validates :user, presence: true

  belongs_to :user
end
