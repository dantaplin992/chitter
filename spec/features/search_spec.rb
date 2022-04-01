require 'peep'
require 'pg'

feature 'search for peeps by keyword' do
  it 'displays peeps that contain the keyword' do
    Peep.create("I have a cat")
    Peep.create("I have a dog")
    visit '/'
    fill_in 'search_text', with: 'cat'
    click_on 'Search'
    expect(current_path).to eq '/search'
    expect(page).to have_content 'I have a cat'
  end
end