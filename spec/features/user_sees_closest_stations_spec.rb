require "rails_helper"

RSpec.describe "As a user" do
  describe "When I visit /" do
    it "I select Greyjoy from the dropdown and click on Get Members" do
      visit '/'

      page.select 'Greyjoy', from: :house
      click_on 'Get Members'
      expect(current_path).to eq("/search")

      expect(page).to have_content("7 Members")
      expect(page).to have_css(".member", count: 7)

      within(first(".member")) do
        expect(page).to have_css(".name")
        expect(page).to have_css(".id")
      end
      # You are to create an app and complete this following user story:
      #
      # As a user
      # When I visit "/"
      # And I select "Greyjoy" from the dropdown
      # And I click on "Get Members"
      # Then my path should be "/search" with "house=greyjoy" in the parameters
      # And I should see a message "7 Members"
      # And I should see a list of the 7 members of House Greyjoy
      # And I should see a name and id for each member.
      #
      #
      # Your key is: egg
    end
  end
end
