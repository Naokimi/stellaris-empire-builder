# == Schema Information
#
# Table name: government_civics
#
#  id            :bigint           not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  civic_id      :bigint           not null
#  government_id :bigint           not null
#
# Indexes
#
#  index_government_civics_on_civic_id       (civic_id)
#  index_government_civics_on_government_id  (government_id)
#
# Foreign Keys
#
#  fk_rails_...  (civic_id => civics.id)
#  fk_rails_...  (government_id => governments.id)
#

class GovernmentCivic < ApplicationRecord
  belongs_to :government
  belongs_to :civic
end
