class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_status
  belongs_to_active_hash :scheduled_delivery
  belongs_to_active_hash :prefecture

  
  validates :item_name           , presence: true
  validates :item_text           , presence: true
  validates :category_id           , presence: true
  validates :status_id           , presence: true
  validates :shipping_status_id           , presence: true
  validates :prefecture_id           , presence: true
  validates :scheduled_delivery_id           , presence: true
  validates :price           , presence: true
  validates :user           , presence: true


end
