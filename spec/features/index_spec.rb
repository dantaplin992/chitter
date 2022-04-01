require 'peep'
require 'pg'

feature 'chitter homepage' do
  it 'displays the homepage' do
    visit '/'
    expect(page).to have_content "Chitter"
  end

  it 'displays peeps that have been added' do
    Peep.create("test peep")
    visit '/'
    expect(page).to have_content "test peep"
  end

  it 'displays who wrote each peep alongside the text' do
    Peep.create("test peep")
    visit '/'
    expect(page).to have_content "Anonymous peeped:"
    expect(page).to have_content "test peep"
  end
end