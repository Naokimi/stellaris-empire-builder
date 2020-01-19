class Ethic < ApplicationRecord
  ETHIC_CATEGORIES = [
    'Authoritarian - Egalitarian',
    'Xenophobe - Xenophile',
    'Militarist - Pacifist',
    'Materialist - Spiritualist',
    'Gestalt Consciousness'
  ].freeze

  validates :name, presence: true, uniqueness: true
  validates :icon, presence: true, uniqueness: true
  validates :value, numericality: { greater_than: 0, less_than: 4 }
  validates :category, inclusion: { in: ETHIC_CATEGORIES }
end
