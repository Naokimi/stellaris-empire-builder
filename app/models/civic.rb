# == Schema Information
#
# Table name: civics
#
#  id          :bigint           not null, primary key
#  description :text
#  effects     :string
#  group       :string
#  icon        :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Civic < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :icon, presence: true, uniqueness: true
  validates :type, inclusion: { in: %w[standard corporate hive machine] }
end
