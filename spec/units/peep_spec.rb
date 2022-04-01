require 'peep'

RSpec.describe Peep do
  it 'adds a new peep' do
    Peep.create("this is a test")
    expect(Peep.all).to include "this is a test"
  end
end