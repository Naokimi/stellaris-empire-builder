# == Schema Information
#
# Table name: species
#
#  id         :bigint           not null, primary key
#  archetype  :string
#  biography  :text
#  name       :string
#  portrait   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  origin_id  :bigint           not null
#
# Indexes
#
#  index_species_on_origin_id  (origin_id)
#
# Foreign Keys
#
#  fk_rails_...  (origin_id => origins.id)
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
