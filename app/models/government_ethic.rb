# == Schema Information
#
# Table name: government_ethics
#
#  id            :bigint           not null, primary key
#  government_id :bigint           not null
#  ethic_id      :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class GovernmentEthic < ApplicationRecord
  belongs_to :government
  belongs_to :ethic
end
