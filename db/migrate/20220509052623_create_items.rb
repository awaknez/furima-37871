class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :item_name,              null:false
      t.text       :text,                   null:false
      t.integer    :item_genre_id,          null:false
      t.integer    :item_status_id,         null:false
      t.integer    :item_shipping_cost_id,  null:false
      t.integer    :prefecture_id,          null:false
      t.integer    :item_shipping_days_id,  null:false
      t.integer    :item_price,             null:false
      t.references :user,                   foreign_key:true
      t.timestamps
    end
  end
end
