require 'rails_helper'

 RSpec.describe Item, type: :model do
   before do
    @item = FactoryBot.build(:item)
   end

   describe 'ユーザー新規登録' do
     context '出品できるとき' do
     it '必要な情報を適切に入力して「出品する」ボタンを押すと、商品情報がデータベースに保存されること' do
     expect(@item).to be_valid
     end
    end
     context '出品できないとき' do
     it '商品名が必須であること' do
       @item.item_name = ''
       @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
     end
     it '商品の説明が必須であること' do
       @item.item_text = ''
       @item.valid?
      expect(@item.errors.full_messages).to include("Item text can't be blank")
     end
     it 'カテゴリーの情報が必須であること' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
     end
     it '商品の状態の情報が必須であること' do
       @item.status_id = ''
       @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
     end
     it '発送元の地域の情報が必須であること' do
       @item.prefecture_id = ''
       @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
     end
     it '発送までの日数の情報が必須であること' do
       @item.scheduled_delivery_id = ''
       @item.valid?
      expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
     end
     it '配送料の負担の情報が必須であること' do
      @item.shipping_status_id = ''
      @item.valid?
     expect(@item.errors.full_messages).to include("Shipping status can't be blank")
     end
     it '価格の情報が必須であること' do
       @item.price = ''
       @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
     end
     it '販売価格が¥300より少ない時は出品できないこと' do
       @item.price = 299
       @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
     end
     it '販売価格が¥9999999より多い時は出品できないこと' do
       @item.price = 10000000
       @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
     end
     it 'priceが全角数字だと保存できないこと' do
       @item.price = '２０００'
       @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
     end
     it '画像の添付が必須であること' do
      @item.image = nil
      @item.valid?
     expect(@item.errors.full_messages).to include("Image can't be blank")
     end
     it 'userが紐付いていないと保存できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
     end
     it 'カテゴリーに「---」が選択されている場合は出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
     end
     it '商品の状態に「---」が選択されている場合は出品できない' do
       @item.status_id = 1
       @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
     end
     it '発送元の地域に「---」が選択されている場合は出品できない' do
       @item.prefecture_id = 0
       @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
     end
     it '発送までの日数に「---」が選択されている場合は出品できない' do
       @item.scheduled_delivery_id = 1
       @item.valid?
      expect(@item.errors.full_messages).to include("Scheduled delivery must be other than 1")
     end
     it '配送料の負担「---」が選択されている場合は出品できない' do
      @item.shipping_status_id = 1
      @item.valid?
     expect(@item.errors.full_messages).to include("Shipping status must be other than 1")
     end
    end
  end
end