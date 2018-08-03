require_relative "spec_helper"

describe "Player" do

  describe "#initialize" do
    it "should create a new player, with name" do
      new_player = Player.new(name: "New Player")
      expect(new_player.name).to eq("New Player")
    end
  end

  describe "#initialize" do
    it "should create a new player, with number" do
      new_player = Player.new(number: 0)
      expect(new_player.number).to eq(0)
    end
  end

  describe "#initialize" do
    it "should create a new player, with position_id" do
      new_player = Player.new(position_id: :RB)
      expect(new_player.position_id).to eq("RB")
    end
  end

  describe "#initialize" do
    it "should create a new player, with team_id" do
      new_player = Player.new(team_id: :ARI)
      expect(new_player.team_id).to eq("ARI")
    end
  end

end
