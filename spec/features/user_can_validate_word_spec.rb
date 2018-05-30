require 'rails_helper'

describe 'As a user' do
  describe 'When I visit the root path' do
    describe 'And I fill in a text box with a valid word and click on \'Validate Word\'' do
      scenario 'I should see a message that confirms that the word is valid' do
        VCR.use_cassette('validate_valid_word') do
          # When I visit "/"
          visit root_path
          # And I fill in a text box with "foxes"
          fill_in :q, with: 'foxes'
          # And I click "Validate Word"
          click_on 'Validate Word'
          # Then I should see a message that says "'foxes' is a valid word and its root form is 'fox'."
          expect(current_path).to eq(search_path)
          expect(page).to have_content "'foxes' is a valid word and its root form is 'fox'."
        end
      end
    end
  end
end


# As a guest user
# When I visit "/"
# And I fill in a text box with "foxez"
# And I click "Validate Word"
# Then I should see a message that says "'foxez' is not a valid word."
