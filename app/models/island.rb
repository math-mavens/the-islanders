class Island < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  validates :name, :price_per_day, :description, :address, presence: true
  validates :description, length: { minimum: 30 }
  validates :price_per_day, numericality: { greater_than: 0 }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def booked?
    bookings.any?(&:active?)
  end
end
