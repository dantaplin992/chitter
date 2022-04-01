require 'peep'
require 'pg'
require 'date'

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

  it 'displays the date each peep was posted' do
    allow(Peep).to receive(:get_date).and_return(DateTime.new(2022, 04, 01, 14, 30))
    Peep.create("Hellooo")
    visit '/'
    expect(first('.peep')).to have_content '2022-04-01 14:30:00'
    expect(first('.peep')).to have_content 'Hellooo'
  end
end