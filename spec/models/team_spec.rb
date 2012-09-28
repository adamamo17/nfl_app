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

require 'spec_helper'

describe Team do

  before { @team = Team.new(team: "CMU Tartans", abbrev: "cmu",
                     url: "http://www.cmu.edu", division: "University Athletic Association") }

  subject { @team }

  it { should respond_to(:team) }
  it { should respond_to(:abbrev) }
  it { should respond_to(:url) }
  it { should respond_to(:division) }

  it { should be_valid }

  describe "when team name is not present" do
    before { @team.team = " " }
    it { should_not be_valid }
  end

  describe "when abbrev is not present" do
    before { @team.url = " " }
    it { should_not be_valid }
  end


  describe "when abbrev is already taken" do
    before do
      team_with_same_abbrev = @team.dup
      team_with_same_abbrev.abbrev = @team.abbrev.upcase
      team_with_same_abbrev.save
    end

    it { should_not be_valid }
  end

  describe "when abbrev is not present" do
    before { @team.abbrev = " " }
    it { should_not be_valid }
  end

  describe "with an abbrev that's too long" do
    before { @team.abbrev = "a" * 5 }
    it { should be_invalid }
  end
end
