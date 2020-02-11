# == Schema Information
#
# Table name: governments
#
#  id          :bigint           not null, primary key
#  authority   :string
#  description :text
#  icon        :string
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

  validates :group, inclusion: { in: AUTHORITIES }
  validates :icon, presence: true
end
