require_relative "spec_helper"

describe "Teamstat" do

  describe "#initialize" do
    it "should create a new teamstat, with team_id" do
      new_teamstat = Teamstat.new(team_id: :ARI)
      expect(new_teamstat.team_id).to eq("ARI")
    end
  end

  describe "#initialize" do
    it "should create a new teamstat, with team_wins" do
      new_teamstat = Teamstat.new(team_wins: 0)
      expect(new_teamstat.team_wins).to eq(0)
    end
  end

  describe "#initialize" do
    it "should create a new teamstat, with team_losses" do
      new_teamstat = Teamstat.new(team_losses: 0)
      expect(new_teamstat.team_losses).to eq(0)
    end
  end

  describe "#initialize" do
    it "should create a new teamstat, with passpct" do
      new_teamstat = Teamstat.new(passpct: 10.5)
      expect(new_teamstat.passpct).to eq(10.5)
    end
  end

  describe "#initialize" do
    it "should create a new teamstat, with passnetyards" do
      new_teamstat = Teamstat.new(passnetyards: 100)
      expect(new_teamstat.passnetyards).to eq(100)
    end
  end

  describe "#initialize" do
    it "should create a new teamstat, with passtd" do
      new_teamstat = Teamstat.new(passtd: 150)
      expect(new_teamstat.passtd).to eq(150)
    end
  end

  describe "#initialize" do
    it "should create a new teamstat, with rushyards" do
      new_teamstat = Teamstat.new(rushyards: 200)
      expect(new_teamstat.rushyards).to eq(200)
    end
  end

  describe "#initialize" do
    it "should create a new teamstat, with rushtd" do
      new_teamstat = Teamstat.new(rushtd: 100)
      expect(new_teamstat.rushtd).to eq(100)
    end
  end

  describe "#initialize" do
    it "should create a new teamstat, with receptions" do
      new_teamstat = Teamstat.new(receptions: 8)
      expect(new_teamstat.receptions).to eq(8)
    end
  end

  describe "#initialize" do
    it "should create a new teamstat, with interceptions" do
      new_teamstat = Teamstat.new(interceptions: 7)
      expect(new_teamstat.interceptions).to eq(7)
    end
  end

  describe "#initialize" do
    it "should create a new teamstat, with fumbles" do
      new_teamstat = Teamstat.new(fumbles: 22)
      expect(new_teamstat.fumbles).to eq(22)
    end
  end

  describe "#initialize" do
    it "should create a new teamstat, with fgpct" do
      new_teamstat = Teamstat.new(fgpct: 96.7)
      expect(new_teamstat.fgpct).to eq(96.7)
    end
  end

  describe "#initialize" do
    it "should create a new teamstat, with totaltd" do
      new_teamstat = Teamstat.new(totaltd: 30)
      expect(new_teamstat.totaltd).to eq(30)
    end
  end

end
