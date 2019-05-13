module PricingRulesHelper
  def get_products(products, sku)
    products.select {|p| p.sku == sku}
  end
end
