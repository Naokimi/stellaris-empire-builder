class Trait < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :icon, presence: true, uniqueness: true
  validates :value, numericality: { greater_than: -3, less_than: 5 }
  validates :type, inclusion: { in: %w[standard biological lithoid robotic] }
end
