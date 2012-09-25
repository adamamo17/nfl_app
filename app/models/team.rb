class Team < ActiveRecord::Base
  attr_accessible :abbrev, :team

  validates :team, presence: true, uniqueness: { case_sensitive: false }
  validates :abbrev, presence: true, length: { maximum: 3 }, uniqueness: { case_sensitive: false }
end
