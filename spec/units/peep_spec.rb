require 'peep'

RSpec.describe Peep do
  it 'adds a new peep' do
    Peep.create("this is a test")
    expect(Peep.all[0]).to include("text" => "this is a test")
  end
  context 'storign the username' do
    it 'stores the username if one is given' do
      Peep.create("this is a test", "DanT")
      expect(Peep.all[0]).to include("username" => "DanT")
    end

    it 'stores "Anonymous" if a username is not given' do
      Peep.create("testpeep")
      expect(Peep.all[0]).to include("username" => "Anonymous")
    end
  end
end