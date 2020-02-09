# == Schema Information
#
# Table name: species_traits
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  species_id :bigint           not null
#  trait_id   :bigint           not null
#
# Indexes
#
#  index_species_traits_on_species_id  (species_id)
#  index_species_traits_on_trait_id    (trait_id)
#
# Foreign Keys
#
#  fk_rails_...  (species_id => species.id)
#  fk_rails_...  (trait_id => traits.id)
#

class SpeciesTrait < ApplicationRecord
  belongs_to :species
  belongs_to :trait
end
