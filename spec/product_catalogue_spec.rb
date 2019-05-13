require_relative '../product_catalogue'

describe ProductCatalogue do
  subject(:product_catalogue) {described_class.new('./spec/fixtures/products.csv')}

  describe '#find' do
    subject(:product) {product_catalogue.find(product_sku)}

    context 'sku in the product catalogue' do
      let(:product_sku) {'tablet'}
      it 'should return nil' do
        expect(product).to eq(nil)
      end
    end

    context 'sku not in the product catalogue' do
      let(:product_sku) {'ipd'}
      it 'should return valid product' do
        expect(product.sku).to eq('ipd')
        expect(product.name).to eq('Super iPad')
        expect(product.price).to eq(599.00)
      end
    end
  end
end

