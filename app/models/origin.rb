class Origin < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :image, presence: true, uniqueness: true

  has_many :species
end
