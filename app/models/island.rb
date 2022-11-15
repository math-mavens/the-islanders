class Island < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :name, :price_per_day, :description, presence: true
  validates :description, length: { minimum: 30 }
  validates :price_per_day, numericality: { greater_than: 0 }
end
