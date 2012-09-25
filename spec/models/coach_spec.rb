# == Schema Information
#
# Table name: coaches
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  team            :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

require 'spec_helper'

describe Coach do

  before { @coach = Coach.new(name: "Andrew.Carnegie", team: "Silicon Valley Programmers",
                              password: "footballrules", password_confirmation: "footballrules") }

  subject { @coach }        # allows us to imply @coach is the variable for all tests

  it { should respond_to(:name) }
  it { should respond_to(:team) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }

  it { should be_valid }

  describe "when name is not present" do
    before { @coach.name = " " }
    it { should_not be_valid }
  end

  describe "when team is not present" do
    before { @coach.team = " " }
    it { should_not be_valid }
  end

  #Name

  describe "when name is too long" do
    before { @coach.name = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when name format is invalid" do
    it "should be invalid" do
      names = %w[andrew.carnegie Andrew.carnegie andrew.Carnegie
                     "Andrew Carnegie"]
      names.each do |invalid_name|
        @coach.name = invalid_name
        @coach.should_not be_valid
      end
    end
  end

  describe "when name format is valid" do
    it "should be valid" do
      names = %w[Andrew.Carnegie Andrew.Mellon Robert.Mellon]
      names.each do |valid_name|
        @coach.name = valid_name
        @coach.should be_valid
      end
    end
  end

  describe "when name is already taken" do
    before do
      user_with_same_name = @coach.dup
      user_with_same_name.save
    end

    it { should_not be_valid }
  end

  #Password

  describe "when password is not present" do
    before { @coach.password = @coach.password_confirmation = " " }
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @coach.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "when password confirmation is nil" do
    before { @coach.password_confirmation = nil }
    it { should_not be_valid }
  end

  #Authentication

  describe "with a password that's too short" do
    before { @coach.password = @coach.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  describe "return value of authenticate method" do
    before { @coach.save }
    let(:found_coach) { Coach.find_by_name(@coach.name) }

    describe "with valid password" do
      it { should == found_coach.authenticate(@coach.password) }
    end

    describe "with invalid password" do
      let(:coach_for_invalid_password) { found_coach.authenticate("invalid") }

      it { should_not == coach_for_invalid_password }
      specify { coach_for_invalid_password.should be_false }
    end
  end

end
