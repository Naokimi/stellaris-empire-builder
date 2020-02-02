# == Schema Information
#
# Table name: origins
#
#  id          :bigint           not null, primary key
#  name        :string
#  image       :string
#  description :text
#  effects     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Origin < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :image, presence: true, uniqueness: true

  has_many :species
end
