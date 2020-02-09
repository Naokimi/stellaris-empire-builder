# == Schema Information
#
# Table name: empires
#
#  id            :bigint           not null, primary key
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  government_id :bigint           not null
#  species_id    :bigint           not null
#
# Indexes
#
#  index_empires_on_government_id  (government_id)
#  index_empires_on_species_id     (species_id)
#
# Foreign Keys
#
#  fk_rails_...  (government_id => governments.id)
#  fk_rails_...  (species_id => species.id)
#

class Empire < ApplicationRecord
  belongs_to :species
  belongs_to :government
end
