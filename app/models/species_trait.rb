# == Schema Information
#
# Table name: species_traits
#
#  id         :bigint           not null, primary key
#  species_id :bigint           not null
#  trait_id   :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SpeciesTrait < ApplicationRecord
  belongs_to :species
  belongs_to :trait
end
