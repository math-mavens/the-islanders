class Booking < ApplicationRecord
  before_validation :set_defaults

  belongs_to :user
  belongs_to :island

  validates :start_date, :end_date, :status, presence: true
  validates :end_date, comparison: { greater_than: :start_date }
  validates :user, uniqueness: { scope: %i[island start_date] }

  def active?
    self[:end_date] >= Date.today
  end

  private

  def set_defaults
    self.status = "pending" if status.blank?
  end
end
