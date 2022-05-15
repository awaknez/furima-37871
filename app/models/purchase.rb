class Purchase < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one    :address

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

end
