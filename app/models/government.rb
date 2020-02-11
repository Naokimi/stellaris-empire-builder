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
  validates :authority, presence: true, uniqueness: true
  validates :icon, presence: true
end
