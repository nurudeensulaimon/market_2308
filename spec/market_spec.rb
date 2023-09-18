require './lib/item'
require './lib/vendor'
require './lib/market'
require 'rspec'
require 'pry'

RSpec.describe Market do 
  before(:each) do 
    @market = Market.new("South Pearl Street Farmers Market")  
    @vendor1 = Vendor.new("Rocky Mountain Fresh")
    @vendor2 = Vendor.new("Ba-Nom-a-Nom") 
    @vendor3 = Vendor.new("Palisade Peach Shack") 

    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: "$0.50"})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
  end

  describe 'initialize' do 
    it 'instantiates a new object' do 
      expect(@market).to be_an_instance_of(Market)
    end
  end
   
   it 'has attributes' do 
    expect(@market.name).to eq("South Pearl Street Farmers Market")
    expect(@market.vendors).to eq([])
   end

   describe '#add_vendors' do 
    it 'has a method that can add vendors' do 
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)
    expect(@market.vendors).to eq([@vendor1,@vendor2,@vendor3])
    end
   end 

   describe '#vendor_names' do 
     it 'can extract vendor names' do 
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)

      expect(@vendor1.name).to eq("Rocky Mountain Fresh")
      expect(@vendor2.name).to eq("Ba-Nom-a-Nom")
      expect(@vendor3.name).to eq("Palisade Peach Shack")
      expect(@market.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
     end
   end

   describe '#vendors that sell'  do 
    it 'returns a list of vendors that sell an item' do 

      @vendor1.stock(@item1, 35)
      @vendor1.stock(@item2, 7)
      @vendor2.stock(@item4, 50)
      @vendor2.stock(@item3, 25)
      @vendor3.stock(@item1, 65)

      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)

      expect(@market.vendors_that_sell(@item1)).to eq([@vendor1, @vendor3])
      expect(@market.vendors_that_sell(@item4)).to eq([@vendor2])
    end
  end

   describe '#potential revenue' do 
    xit 'returns potential if everything is sold' do
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)

      expect(@vendor1.potential_revenue).to eq(29.75)
      expect(@vendor2.potential_revenue).to eq(345.00)
      expect(@vendor3.potential_revenue).to eq(48.75)
    end
   end
end

