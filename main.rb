require_relative  './checkout'
require './product_catalogue'
require_relative './pricing_rules/bulk_discount'
require_relative './pricing_rules/x_free_when_y_purchased_deal'
require_relative './pricing_rules/x_items_for_y_price_deal'


catalogue = ProductCatalogue.new("./spec/fixtures/products.csv")
ipad = catalogue.find('ipd')
vga = catalogue.find('vga')
macbook = catalogue.find('mbp')


atv_offer =  XItemsForYPriceDeal.new('atv', 3, 2)
bulk_discount =  BulkDiscount.new('ipd', 4, 499.00)
free_product_offer = XFreeWhenYPurchasedDeal.new('vga', 'mbp')
pricing_rules = [ atv_offer, bulk_discount, free_product_offer]


checkout =  Checkout.new(pricing_rules)
5.times do
  checkout.scan(ipad)
end
3.times do
  checkout.scan(vga)
end
3.times do
  checkout.scan(macbook)
end
p checkout.total()
