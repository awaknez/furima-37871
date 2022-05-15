class PurchaseAddress
  include ActiveModel::Model

  attr_accessor :item_id, :user_id, :post_number, :prefecture_id, :municipality, :address, :building_name, :phone_number, :purchase_id, :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_number,    format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id,  numericality: { other_than: 1 ,message: "can't be blank"}
    validates :municipality
    validates :address
    validates :phone_number,   format:{with:/\A[0-9]{10,11}\z/}
    validates :token
  end

 
  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(post_number: post_number,prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end

end