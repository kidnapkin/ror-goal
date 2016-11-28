class Task < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true
  validates :due_date, presence: true
  validates :priority, presence: true, inclusion: {in: 1..10}
  validate :due_date_cannot_be_in_the_past

  def due_date_cannot_be_in_the_past
    errors.add(:due_date, "can't be in the past") if due_date? && due_date < Time.zone.today
  end

  scope :completed, ->(condition) {  where(completed: condition) }
  
  # The same as scope :sort_order, ->(sort_param) { order(sort_param) }
  def self.sort_order(sort_param)
    order( sort_param )
  end
end