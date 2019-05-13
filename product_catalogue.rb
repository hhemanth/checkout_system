require "CSV"
require_relative './product'

class ProductCatalogue


  def initialize(products_file)
    @products = []
    build_products(products_file)
  end

  def find(sku)
    products.detect {|p| p.sku == sku}
  end

  private

  def build_products(csv_file)
    CSV.foreach(csv_file, :headers => true) do |row|
      products << Product.new(row["SKU"], row["Name"], row["Price"].to_f)
    end
  end
  private

  attr_reader :products

end
