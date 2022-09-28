require 'rails_helper'

 RSpec.describe OrderPurchaseRecord, type: :model do
   before do
    @order_purchase_record = FactoryBot.build(:order_purchase_record)
   end

   describe '商品購入機能' do
    context '商品購入できるとき' do
     it 'city,addresses,phone_number,prefecture_id,postal_code,user_id,item_id,tokenが入力されていること' do
     expect(@order_purchase_record).to be_valid
     end
    end
    context '商品購入ができない時' do
     it 'cityが空では登録できない' do
      @order_purchase_record.city = ''
      @order_purchase_record.valid?
      expect(@order_purchase_record.errors.full_messages).to include("City can't be blank")
     end

     it 'addressesが空では登録できない' do
      @order_purchase_record.addresses = ''
      @order_purchase_record.valid?
      expect(@order_purchase_record.errors.full_messages).to include("Addresses can't be blank")
     end

     it 'phone_numberが空では登録できない' do
      @order_purchase_record.phone_number = ''
      @order_purchase_record.valid?
      expect(@order_purchase_record.errors.full_messages).to include("Phone number can't be blank")
     end

     it 'prefecture_idが空では登録できない' do
      @order_purchase_record.prefecture_id = ''
      @order_purchase_record.valid?
      expect(@order_purchase_record.errors.full_messages).to include("Prefecture can't be blank")
     end

     it 'postal_codeが空では登録できない' do
      @order_purchase_record.postal_code = ''
      @order_purchase_record.valid?
      expect(@order_purchase_record.errors.full_messages).to include("Postal code can't be blank")
     end

     it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
      @order_purchase_record.postal_code = '3990033'
      @order_purchase_record.valid?
      expect(@order_purchase_record.errors.full_messages).to include("Postal code is invalid")
     end

     it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと' do
      @order_purchase_record.phone_number = '12345678999'
      @order_purchase_record.valid?
      expect(@order_purchase_record.errors.full_messages).to include("Phone number is invalid")
     end
    end
  end
end
