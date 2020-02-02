# == Schema Information
#
# Table name: ethics
#
#  id          :bigint           not null, primary key
#  name        :string
#  icon        :string
#  value       :integer
#  effects     :string
#  category    :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

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
