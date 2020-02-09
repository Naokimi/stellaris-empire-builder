# == Schema Information
#
# Table name: homeworlds
#
#  id         :bigint           not null, primary key
#  group      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  species_id :bigint           not null
#
# Indexes
#
#  index_homeworlds_on_species_id  (species_id)
#
# Foreign Keys
#
#  fk_rails_...  (species_id => species.id)
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
  validates :group, inclusion: { in: DEFAULT_PLANET_TYPES + SPECIAL_PLANET_TYPES }

  belongs_to :species
end
