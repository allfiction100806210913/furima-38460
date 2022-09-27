class Order < ApplicationRecord

  #validates :item_prefecture_id, presence: true
  #validates :city, presence: true
  #validates :building, presence: true
  #validates :addresses, presence: true
  #validates :phone_number, presence: true
  #validates :purchase_record, presence: true
  #validates :token, presence: true
  belongs_to :purchase_record
  belongs_to_active_hash :prefecture
  attr_accessor :token

end