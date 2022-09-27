class OrderPurchaseRecord

  include ActiveModel::Model
  attr_accessor :price, :prefecture_id, :city, :building, :addresses, :phone_number, :purchase_record, :token, :user_id, :item_id, :postal_code
  with_options presence: true do
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'is invalid'}
    validates :user_id
    validates :city
    validates :building
    validates :addresses
    validates :phone_number
    validates :purchase_record
    validates :token
    validates :item_id
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}

  end
  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id )
    Order.create(prefecture_id: prefecture_id, postal_code: postal_code, price: price, city: city, building: building, addresses: addresses, phone_number: phone_number, purchase_record: purchase_record.id, token: token)
  end
end