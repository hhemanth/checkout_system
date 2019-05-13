require_relative './../../pricing_rules/x_items_for_y_price_deal'

describe XItemsForYPriceDeal do
  subject(:discount) {described_class.new(sku, x_items, y_items)}
  let(:p1) {instance_double('product', sku: 'ipd', price: 500.00)}
  let(:p2) {instance_double('product', sku: 'mbp', price: 1500.00)}

  describe '#apply' do
    context '3 for 2 deal on ipads' do
      let(:sku) {'ipd'}
      let(:x_items) {3}
      let(:y_items) {2}
      context 'when 3 ipads are bought' do
        it 'expected to return correct discount' do
          expect(discount.apply([p1, p1, p1, p2, p2])).to eq(500)
        end
      end

      context 'when 7 ipads are bought' do
        it 'expected to return correct discount' do
          expect(discount.apply([p1, p1, p1, p1, p1, p1 ,p1])).to eq(1000)
        end
      end

      context 'when 2 ipads are bought' do
        it 'expected to return correct discount' do
          expect(discount.apply([p1, p1, p2])).to eq(0)
        end
      end

    end
  end
end

