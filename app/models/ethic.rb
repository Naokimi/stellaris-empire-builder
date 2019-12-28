class Ethic < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :icon, presence: true, uniqueness: true
  validates :value, numericality: { greater_than: 0, less_than: 4 }
  validates :category, inclusion: { in: %w(gestalt faith war immigration hierarchy) }
end
