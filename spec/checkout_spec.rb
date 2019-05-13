require_relative '../checkout'
require_relative '../product'
require_relative '../pricing_rules/bulk_discount'
require_relative '../pricing_rules/x_free_when_y_purchased_deal'
require_relative '../pricing_rules/x_items_for_y_price_deal'


describe Checkout do
  subject(:checkout) {described_class.new(pricing_rules)}
  let(:ipd) {Product.new('ipd', 'Super Ipad', 549.00)}
  let(:macbook) {Product.new('mbp', 'Macbookpro', 1399.00)}
  let(:atv) {Product.new('atv', 'Apple TV', 109.00)}
  let(:vga) {Product.new('vga', ' VGA Adapter', 30.00)}
  let(:atv_offer) {XItemsForYPriceDeal.new('atv', 3, 2)}
  let(:bulk_discount) {BulkDiscount.new('ipd', 4, 499.00)}
  let(:free_product_offer) {XFreeWhenYPurchasedDeal.new('vga', 'mbp')}

  describe '#total' do
    context 'when 2 products are scanned and no discounts' do
      let(:pricing_rules) {[]}
      before do
        checkout.scan(ipd)
        checkout.scan(macbook)
      end

      it 'expect product total to be total of products scanned' do
        expect(checkout.total).to eq(1948.00)
      end
    end

    context 'when 3 for 2 deal is applicable for Apple Tvs' do
      let(:pricing_rules) {[atv_offer]}
      before do
        checkout.scan(atv)
        checkout.scan(atv)
        checkout.scan(atv)
      end
      it 'expect total for only 2 atvs' do
        expect(checkout.total).to eq(218.00)
      end
    end

    context 'when bulk discount and 3 for 2 is applicable' do
      let(:pricing_rules) {[bulk_discount, atv_offer]}
      before do
        5.times do
          checkout.scan(ipd)
        end
        3.times do
          checkout.scan(atv)
        end
      end

      it 'expect price of ipad to drop to 499.00 and 3 for 2 offer apply' do
        expect(checkout.total).to eq(2713.00)
      end

    end

    context ' when free products deal is applicable' do
      let(:pricing_rules) {[bulk_discount, atv_offer, free_product_offer]}
      before do
        5.times do
          checkout.scan(ipd)
        end
        3.times do
          checkout.scan(vga)
        end
        3.times do
          checkout.scan(macbook)
        end
      end

      it 'expect price of ipad to drop to 499.00 and vgas to be free' do
        expect(checkout.total).to eq(6692.00)
      end
    end
  end

end

