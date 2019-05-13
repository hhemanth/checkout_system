require_relative './pricing_rules_helper'

class XItemsForYPriceDeal
  include PricingRulesHelper

  def initialize(sku, x_items, y_items)
    @sku = sku
    @x_items = x_items
    @y_items = y_items
  end

  def apply(products)
    selected_products = get_products(products, @sku)
    product = selected_products.first
    if (selected_products.size >= @x_items)
      discount_multiple = selected_products.size / @x_items
      return product.price * (@x_items - @y_items) * discount_multiple
    else
      return 0
    end
  end
end
