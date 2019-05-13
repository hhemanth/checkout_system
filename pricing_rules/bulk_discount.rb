require_relative './pricing_rules_helper'


class BulkDiscount
  include PricingRulesHelper
  def initialize(sku, threshold_items, target_price)
    @sku = sku
    @threshold_items = threshold_items
    @target_price = target_price

  end

  def apply(products)
    selected_products = get_products(products, @sku)
    product = selected_products.first
    if (selected_products.size >= @threshold_items)
      return (product.price - @target_price) * selected_products.size
    else
      return 0
    end
  end
end
