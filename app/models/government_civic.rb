# == Schema Information
#
# Table name: government_civics
#
#  id            :bigint           not null, primary key
#  government_id :bigint           not null
#  civic_id      :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class GovernmentCivic < ApplicationRecord
  belongs_to :government
  belongs_to :civic
end
