class Booking < ApplicationRecord
  before_validation :set_defaults

  belongs_to :user
  belongs_to :island

  validates :start_date, :end_date, :status, presence: true
  validates :end_date, comparison: { greater_than: :start_date }
  validates :user, uniqueness: { scope: %i[island start_date] }
  validate :start_date_after_today

  def active?
    end_date >= Date.today && (status == "pending" || status == "approved")
  end

  private

  def start_date_after_today
    return if start_date.blank? || end_date.blank?

    if start_date < Date.today
      errors.add(:start_date, "must be either today or in the future")
    end
  end

  def set_defaults
    self.status = "pending" if status.blank?
  end
end
