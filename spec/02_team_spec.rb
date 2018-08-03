require_relative "spec_helper"

describe "Team" do

  describe "#initialize" do
    it "should create a new team, with name" do
      new_team = Team.new(name: "New Team")
      expect(new_team.name).to eq("New Team")
    end
  end

  describe "#initialize" do
    it "should create a new team, with city" do
      new_team = Team.new(city: "New City")
      expect(new_team.city).to eq("New City")
    end
  end

  describe "#initialize" do
    it "should create a new player, with team_id" do
      new_team = Team.new(team_id: :ARI)
      expect(new_team.team_id).to eq("ARI")
    end
  end

end
