# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null
#  team       :string(255)
#  abbrev     :string(255)      primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  url        :string(255)
#  division   :string(255)
#

class Team < ActiveRecord::Base
  self.primary_key = :abbrev
  attr_accessible :abbrev, :team, :url, :division

  validates :team, presence: true, uniqueness: { case_sensitive: false }
  validates :abbrev, presence: true, length: { maximum: 3 }, uniqueness: { case_sensitive: false }
  validates :url, presence: true
  validates :division, presence: true
end
