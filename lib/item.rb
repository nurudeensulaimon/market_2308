class Item 
attr_reader :name,
            :price
  def initialize(item_info)
    @name = item_info[:name]
    @price = format_price(item_info[:price])
  end

  def format_price(money)
    money.gsub("$", "").to_f
  end
end