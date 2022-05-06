# README

user

item

purchase - 


#テーブル設計

## usersテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| email                 | string     | null: false, unique: true      | 
| encrypted_password    | string     | null: false                    |
| name_first_name       | string     | null: false                    |
| name_family_name      | string     | null: false                    |
| name_first_name_kana  | string     | null: false                    |
| name_family_name_kana | string     | null: false                    |
| birthday              | date       | null: false                    |
| nickname              | string     | null: false                    |

### Association
- has_many :purchases
- has_many :items

## itemsテーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| item_name              | string     | null: false                    | 
| item_text              | text       | null: false                    |
| item_genre _id         | integer    | null: false                    |
| item_status _id        | integer    | null: false                    |
| item_shipping_cost _id | integer    | null: false                    |
| prefecture _id         | integer    | null: false                    |
| item_shipping_days _id | integer    | null: false                    |
| item_price             | integer    | null: false                    |
| user                   | references | foreign_key: true              |

### Association
- belongs_to :user
- has_one    :purchase

## purchaseテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item       | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one    :address

## addressテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_number     | string     | null: false                    |
| prefecture _id  | integer    | null: false                    |
| municipality    | string     | null: false                    |
| address         | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |
| purchase        | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase
