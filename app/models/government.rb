# == Schema Information
#
# Table name: governments
#
#  id          :bigint           not null, primary key
#  type        :string
#  icon        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Government < ApplicationRecord
  AUTHORITIES = %w[Humanoid
                   Mammalian
                   Reptilian
                   Avian
                   Arthropoid
                   Molluscoid
                   Fungoid
                   Plantoid
                   Lithoid
                   Machine].freeze

  validates :type, inclusion: { in: AUTHORITIES }
  validates :icon, presence: true
end
