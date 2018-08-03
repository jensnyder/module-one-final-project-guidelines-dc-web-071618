require_relative "spec_helper"

describe "Division" do

  describe "#initialize" do
    it "should create a new division" do
      new_division = Division.new(name: "New Division")
      expect(new_division.name).to eq("New Division")
    end
  end

end
