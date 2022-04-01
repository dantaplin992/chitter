require 'peep'
require 'date'

RSpec.describe Peep do
  it 'adds a new peep' do
    Peep.create("this is a test")
    expect(Peep.all[0]).to include("text" => "this is a test")
  end

  context 'storing the username' do
    it 'stores the username if one is given' do
      Peep.create("this is a test", "DanT")
      expect(Peep.all[0]).to include("username" => "DanT")
    end

    it 'stores "Anonymous" if a username is not given' do
      Peep.create("testpeep")
      expect(Peep.all[0]).to include("username" => "Anonymous")
    end
  end

  context 'storing the date' do
    it 'generates a datetime object to store' do
      date = DateTime.new(2022, 04, 01, 14, 30)
      allow(Peep).to receive(:get_date).and_return(DateTime.new(2022, 04, 01, 14, 30))
      expect(Peep.get_date).to eq date
    end
  end

  it 'searches the database for peeps containing a keyword' do
    Peep.create("I love cats")
    expect(Peep.search("cats")[0]).to include("text" => "I love cats")
  end
end