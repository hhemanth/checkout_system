require_relative '../product'

describe Product do
  subject(:product) { described_class.new('ipd', 'Super iPad', 599.00) }

  describe '#sku' do
    it 'expected to return sku' do
      expect(product.sku).to eq('ipd')
    end
  end

  describe '#name' do
    it 'expected to return name' do
      expect(product.name).to eq('Super iPad')
    end
  end

  describe '#price' do
    it 'expected to return price' do
      expect(product.price).to eq(599.00)
    end
  end

end

