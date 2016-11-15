class Task < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true
  validates :due_date, presence: true
  validates :priority, presence: true
  
  validates_each :due_date do |record, attr, value|
    record.errors.add(attr, 'Due dater must be in the future') if value <= Time.now.to_date
  end
end
