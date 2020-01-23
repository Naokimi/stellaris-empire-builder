class Species < ApplicationRecord
  ARCHETYPES = %w[Humanoid
                  Mammalian
                  Reptilian
                  Avian
                  Arthropoid
                  Molluscoid
                  Fungoid
                  Plantoid
                  Lithoid
                  Machine].freeze

  validates :name, presence: true, uniqueness: true
  validates :portrait, presence: true
  validates :archetype, inclusion: { in: ARCHETYPES }

  belongs_to :origin

  # create a method portraits that returns the scraped portraits for the specific archetype
end
