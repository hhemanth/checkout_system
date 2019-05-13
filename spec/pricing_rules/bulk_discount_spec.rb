require_relative './../../pricing_rules/bulk_discount'

describe BulkDiscount do
  subject(:discount) {described_class.new(sku, threshold_items, target_price)}
  let(:p1) {instance_double('product', sku: 'ipd', price: 549.00)}
  let(:p2) {instance_double('product', sku: 'mbp', price: 1500.00)}

  describe '#apply' do
    context 'buy more than 4 ipads, and pay $499 each only' do
      let(:sku) {'ipd'}
      let(:threshold_items) {4}
      let(:target_price) {499.00}
      context 'when 4 ipads are bought' do
        it 'expected to return correct discount' do
          expect(discount.apply([p1, p1, p1, p1,p2])).to eq(200)
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

