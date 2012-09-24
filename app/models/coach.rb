# == Schema Information
#
# Table name: coaches
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  team       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Coach < ActiveRecord::Base
  attr_accessible :name, :team, :password, :password_confirmation
  has_secure_password

  VALID_NAME_REGEX = /[A-Z][a-z]+\.[A-Z][a-z]+/
  validates(:name, presence: true, length: { maximum: 50 }, format: {with: VALID_NAME_REGEX}, uniqueness: true )
  validates(:team, presence: true)

  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
end
