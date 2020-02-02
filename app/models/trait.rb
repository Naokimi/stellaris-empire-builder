# == Schema Information
#
# Table name: traits
#
#  id          :bigint           not null, primary key
#  name        :string
#  icon        :string
#  value       :integer
#  effects     :string
#  description :text
#  category    :string
#  type        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Trait < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :icon, presence: true, uniqueness: true
  validates :value, numericality: { greater_than: -3, less_than: 5 }
  validates :type, inclusion: { in: %w[standard biological lithoid robotic] }

  has_many :species, through: :species_traits
end
