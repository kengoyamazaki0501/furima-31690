# テーブル設計

## users テーブル

| Column     | Type    | Options     |
| ---------  | ------- | ----------- |
| email      | string  | null: false |
| password   | string  | null: false |
| name       | string  | null: false |
| profile    | string  | null: false |
| occupation | string  | null: false |
| position   | string  | null: false |

### Association

- has_many :prototypes 
- has_many :comments

##  items テーブル

| Column     | Type         | Options                        |
| ---------- | ------------ | ------------------------------ |
| title      | string       | null: false                    |
| catch_copy | text         | null: false                    |
| concept    | text         |                                |
| user       | references   | null: false, foreign_key: true |
### Association

- has_many :comments 
- belongs_to :user

##  テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| text        | text       | null: false,                   |
| user        | references | null: false, foreign_key: true |
| prototype   | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- belongs_to :prototypes
