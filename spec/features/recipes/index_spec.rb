require 'rails_helper'

RSpec.describe 'the recipe index' do
  it 'is a list of recipes and their attributes' do
    spaghetti = Recipe.create!(name: 'Spaghetti', complexity: 2, genre: 'Italian')
    fried = Recipe.create!(name: 'Fried Rice', complexity: 3, genre: 'Chinese')
    falafel = Recipe.create!(name: 'Falafel', complexity: 4, genre: 'Mediterranean')

    visit '/recipes'

    expect(page).to have_content('Name: Spaghetti')
    expect(page).to have_content('Complexity: 2')
    expect(page).to have_content('Genre: Italian')

    expect(page).to have_content('Name: Fried Rice')
    expect(page).to have_content('Complexity: 3')
    expect(page).to have_content('Genre: Chinese')

    expect(page).to have_content('Name: Falafel')
    expect(page).to have_content('Complexity: 4')
    expect(page).to have_content('Genre: Mediterranean')
  end
end
