class Item < ApplicationRecord

belongs_to :user
# has_one    :purchase
extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :item_genre
belongs_to :item_status
belongs_to :item_shipping_cost
belongs_to :item_shipping_days
belongs_to :prefecture

validates :item_name,             presence: true
validates :text,                  presence: true
validates :item_genre_id,         presence: true, numericality: { other_than: 1 }
validates :item_status_id,        presence: true, numericality: { other_than: 1 }
validates :item_shipping_cost_id, presence: true, numericality: { other_than: 1 }
validates :prefecture_id,         presence: true, numericality: { other_than: 1 }
validates :item_shipping_days_id, presence: true, numericality: { other_than: 1 }
validates :item_price,            presence: true

end
