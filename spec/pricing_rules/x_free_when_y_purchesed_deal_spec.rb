require_relative './../../pricing_rules/x_free_when_y_purchased_deal'

describe XFreeWhenYPurchasedDeal do
  subject(:discount) { described_class.new(free_sku, purchased_sku) }
  let(:p1) { instance_double('product', sku: 'ipd', price: 500.00) }
  let(:p2) { instance_double('product', sku: 'mbp', price: 1500.00) }
  let(:p3) { instance_double('product', sku: 'atv', price: 30.00) }

  describe '#free_products' do
    context 'free vga when macbookpro purchased' do
      let(:free_sku) {'atv'}
      let(:purchased_sku) { 'mbp' }
      context 'when 1 macbookpro is bought' do
        it 'expected to return correct product and discount' do
          expect(discount.apply([p1, p2, p3])).to eq(30)
        end
      end

      context 'when 3 macbookpros are bought' do
        it 'expected to return correct product and discount' do
          expect(discount.apply([p1, p2, p2, p2, p3, p3, p3 ])).to eq(90)
        end
      end

    end
  end
end

