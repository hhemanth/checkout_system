require_relative './pricing_rules_helper'

class XFreeWhenYPurchasedDeal
  include PricingRulesHelper

  def initialize(free_sku, purchased_sku)
    @free_sku = free_sku
    @purchased_sku = purchased_sku
  end

  def apply(products)
    purchased_skus = get_products(products, @purchased_sku)
    free_skus = get_products(products, @free_sku)
    free_product = free_skus.first
    if free_skus.size >= purchased_skus.size
      return purchased_skus.size * free_product.price
    else
      return free_skus.size * free_product.price
    end
  end

end
