# テーブル設計

##  users テーブル

| Column            | Type    | Options     |
| ----------------- | ------- | ----------- |
| nickname          | string  | null: false |
| email             | string  | null: false |
| encrypted_password| string  | null: false |
| last_name         | string  | null: false |
| first_name        | string  | null: false |
| last_name_kana    | string  | null: false |
| first_name_kana   | string  | null: false |
| birthday          | date    | null: false |
### Association

- has_many :items
- has_many :orders

##  items テーブル

| Column          | Type         | Options                        |
| --------------- | ------------ | ------------------------------ |
| product_name    | string       | null: false                    |
| explanation     | text         | null: false                    |
| category_id     | integer      | null: false                    |
| condition_id    | integer      | null: false                    |
| burden_id       | integer      | null: false                    |
| country_id      | integer      | null: false                    |
| delivery_days_id| integer      | null: false                    |
| price           | integer      | null: false                    |
| user            | references   | null: false, foreign_key:true  |
### Association

-  belongs_to :user
-  belongs_to :orders

##  orders テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| item        | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |
### Association

-  has_one :item
-  belongs_to :address 

##   addresses テーブル

| Column       | Type         | Options                        |
| ------------ | ------------ | ------------------------------ |
| postal_code  | string       | null: false                    |
| country_id   | integer      | null: false                    |
| city         | string       | null: false                    |
| address      | string       | null: false                    |
| building_name| string       | null: false                    |
| phone_number | integer      | null: false                    |
### Association

belongs_to order