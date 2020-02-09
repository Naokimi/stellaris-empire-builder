# == Schema Information
#
# Table name: government_ethics
#
#  id            :bigint           not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  ethic_id      :bigint           not null
#  government_id :bigint           not null
#
# Indexes
#
#  index_government_ethics_on_ethic_id       (ethic_id)
#  index_government_ethics_on_government_id  (government_id)
#
# Foreign Keys
#
#  fk_rails_...  (ethic_id => ethics.id)
#  fk_rails_...  (government_id => governments.id)
#

class GovernmentEthic < ApplicationRecord
  belongs_to :government
  belongs_to :ethic
end
