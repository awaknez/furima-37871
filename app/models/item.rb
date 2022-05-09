class Item < ApplicationRecord

belongs_to :user
# has_one    :purchase
extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :item_genre
belongs_to :item_status
belongs_to :item_shipping_cost
belongs_to :item_shipping_days
belongs_to :prefecture
has_one_attached :image

validates :image,                 presence: true
validates :item_name,             presence: true
validates :text,                  presence: true
validates :item_genre_id,         presence: true, numericality: { other_than: 1 ,message: "can't be blank"}
validates :item_status_id,        presence: true, numericality: { other_than: 1 ,message: "can't be blank"}
validates :item_shipping_cost_id, presence: true, numericality: { other_than: 1 ,message: "can't be blank"}
validates :prefecture_id,         presence: true, numericality: { other_than: 1 ,message: "can't be blank"}
validates :item_shipping_days_id, presence: true, numericality: { other_than: 1 ,message: "can't be blank"}
validates :item_price,            presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to:9999999,message: "is out of setting range"}, format: {with:/\A\d{3}/,message: "is invalid. Input half-width characters"}

end
