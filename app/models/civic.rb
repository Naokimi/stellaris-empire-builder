class Civic < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :icon, presence: true, uniqueness: true
  validates :type, inclusion: { in: %w[standard corporate hive machine] }
end
