class Task < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true
  validates :due_date, presence: true
  validates :priority, presence: true # priority should be a number
  validate :due_date_cannot_be_in_the_past

  def due_date_cannot_be_in_the_past
    # use due_date? instead of due_date.present?
    errors.add(:due_date, "can't be in the past") if due_date.present? && due_date < Time.zone.today
  end
end
