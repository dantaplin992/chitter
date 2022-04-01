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

  it 'uses the form on the homepage to add a new peep' do
    visit '/'
    fill_in 'username', with: 'DanT'
    fill_in 'peep_text', with: 'I like turtles'
    click_button 'Submit'

    expect(current_path).to eq '/'
    expect(page).to have_content 'DanT peeped:'
    expect(page).to have_content 'I like turtles'
  end
end