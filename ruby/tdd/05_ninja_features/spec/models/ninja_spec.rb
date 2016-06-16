require 'rails_helper'

RSpec.describe Ninja, type: :model do
  it "should not save if name field is blank." do
   ninja = Ninja.new(name: '', description: 'description')
   expect(ninja).to be_invalid
  end
  it "should not save if description field is blank." do
   ninja = Ninja.new(name: 'name', description: '')
   expect(ninja).to be_invalid
  end
  it 'is valid with name and description' do
    ninja = Ninja.new(name: 'name', description: 'description')
    expect(ninja).to be_valid
  end
end
