require "rails_helper"

describe WesterosService do
  context "instance methods" do
    context "#members_by_house" do
      it "returns member data" do
        search = subject.members_by_house('Greyjoy')
        expect(search).to be_a Array
        # expect(search[:data].first).to be_an Array
        # expect(search[:data].first[:attributes][:members].count).to eq 7
        house_data = search.first

        expect(house_data).to have_key :name
        expect(house_data).to have_key :id
      end
    end
  end
end
