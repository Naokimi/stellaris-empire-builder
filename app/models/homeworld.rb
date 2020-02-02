# == Schema Information
#
# Table name: homeworlds
#
#  id         :bigint           not null, primary key
#  name       :string
#  species_id :bigint           not null
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Homeworld < ApplicationRecord
  DEFAULT_PLANET_TYPES = %w[Arid
                            Desert
                            Savanna
                            Alpine
                            Arctic
                            Tundra
                            Continental
                            Ocean
                            Tropical].freeze
  SPECIAL_PLANET_TYPES = %w[Gaia
                            Tomb
                            Ecumenopolis
                            Relic
                            Ring
                            Habitat
                            Machine
                            Hive].freeze

  validates :name, presence: true, uniqueness: true
  validates :type, inclusion: { in: DEFAULT_PLANET_TYPES + SPECIAL_PLANET_TYPES }

  belongs_to :species
end
