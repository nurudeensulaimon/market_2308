require './lib/item'
require './lib/vendor'
require 'rspec'
require 'pry'

RSpec.describe Item do 
  before(:each) do
  @item1 = Item.new({name: 'Peach', price: "$0.75"})
  @item2 = Item.new({name: 'Tomato', price: '$0.50'})
  end 

  it 'exists' do 
    expect(@item1).to be_a_instance_of(Item)
    expect(@item2).to be_a_instance_of(Item)
  end

  it 'has attributes' do 
    expect(@item2.name).to eq("Tomato")
    expect(@item2.price).to eq(0.5)
  end
end