# README

user

item

purchase - 


#テーブル設計

## usersテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| email                 | string     | null: false, unique: true      | 
| password              | string     | null: false                    |
| name_first_name       | string     | null: false                    |
| name_family_name      | string     | null: false                    |
| name_first_name_kana  | string     | null: false                    |
| name_family_name_kana | string     | null: false                    |
| birthday              | integer    | null: false                    |
| nickname              | string     | null: false                    |

### Association
- has_many :purchases
- has_many :items

## itemsテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item_name           | string     | null: false                    | 
| item_text           | text       | null: false                    |
| item_genre          | string     | null: false                    |
| item_status         | string     | null: false                    |
| item_shipping_cost  | string     | null: false                    |
| item_shipping_area  | string     | null: false                    |
| item_shipping_days  | string     | null: false                    |
| item_price          | integer    | null: false                    |

### Association
- belongs_to :user
- has_one    :purchase

## purchaseテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item_id    | references | null: false, foreign_key: true |
| user_id    | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one    :address

## addressテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_number     | integer    | null: false                    |
| prefecture      | string     | null: false                    |
| municipality    | string     | null: false                    |
| address         | string     | null: false                    |
| building_name   | string     | null: false                    |
| phone_number    | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase
