require './lib/item'
require './lib/vendor'
require 'rspec'
require 'pry'

require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do
  before(:each) do
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})

    @vendor = Vendor.new("Rocky Mountain Fresh")
  end

  describe '#initialize' do
    it 'instantiates a new object' do
      expect(@vendor).to be_an_instance_of(Vendor)
    end

    it 'has attributes' do
      expect(@vendor.name).to eq("Rocky Mountain Fresh")
      expect(@vendor.inventory).to eq({})
    end
  end

  describe '#check stock' do 
    it 'returns the number of items in inventory' do
      expect(@vendor.check_stock(@item1)).to eq(0)
      @vendor.stock(@item1, 30)
      expect(@vendor.check_stock(@item1)).to eq(30)
      @vendor.stock(@item1, 25)
      expect(@vendor.check_stock(@item1)).to eq(55)
      @vendor.stock(@item2, 12)
      expect(@vendor.check_stock(@item2)).to eq(12)

    end
  end

  describe "#stock" do
    it "stocks and item" do
      @vendor.stock(@item1, 30)
      expect(@vendor.inventory).to eq({@item1 => 30})
      @vendor.stock(@item1, 25)
      expect(@vendor.inventory).to eq({@item1 => 55})
      @vendor.stock(@item2, 12)
      expect(@vendor.inventory).to eq({@item1 => 55, @item2 => 12})
    end
  end
end