class Product
  attr_reader :sku, :name, :price

  def initialize(sku, name, price)
    @name = name
    @sku = sku
    @price = price
  end
end
