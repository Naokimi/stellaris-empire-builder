# == Schema Information
#
# Table name: empires
#
#  id            :bigint           not null, primary key
#  name          :string
#  species_id    :bigint           not null
#  government_id :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Empire < ApplicationRecord
  belongs_to :species
  belongs_to :government
end
