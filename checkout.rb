require_relative './product_catalogue'

class Checkout
  attr_accessor :pricing_rules, :product_catalogue, :products, :total
  def initialize(pricing_rules, product_catalogue = nil)
      self.product_catalogue = product_catalogue
      self.pricing_rules = pricing_rules
      self.products = []
  end

  # def scan(sku)
  #   products << product_catalogue.find(sku)
  # end
  def scan(product)
    products << product
  end

  def total
    total = products.sum{|p| p.price.to_f}
    discount = apply_pricing_rules
    total - discount
  end

  def apply_pricing_rules
    pricing_rules.sum { |rule| rule.apply(products) }
  end
end
