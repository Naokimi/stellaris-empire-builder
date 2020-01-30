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
