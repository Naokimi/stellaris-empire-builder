# == Schema Information
#
# Table name: species
#
#  id         :bigint           not null, primary key
#  name       :string
#  bigraphy   :text
#  archetype  :string
#  portrait   :string
#  origin_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

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
  has_many :traits, through: :species_traits
  has_many :homeworlds

  # create a method portraits that returns the scraped portraits for the specific archetype
  # or create a portrait model, scrape images from wiki, and list the portraits based on archetype
end
