# テーブル設計

## users テーブル

| Column          　| Type   | Options                      |
| --------------- 　| ------ | -----------------------------|
| nickname        　| string | null: false                  |
| email           　| string | null: false,uniqueness: true |
| encrypted_password| string | null: false                  |
| last_name       　| string | null: false                  |
| first_name      　| string | null: false                  |
| last_name_kana  　| string | null: false                  |
| first_name_kana 　| string | null: false                  |
| birthday        　| date   | null: false                  |

### Association

- has_many :items
- has_one :order



## items テーブル

| Column      | Type    | Options                        |
| ------------| ------- | ------------------------------ |
| name        | string  | null: false                    |
| discription | text　  | null: false                    |
| category_id | integer | null: false                    |
| status_id   | integer | null: false                    |
| send_fee_id | integer | null: false                    |
| send_area_id| integer | null: false                    |
| send_days_id| integer | null: false                    |
| price       | string  | null: false                    |
| user_id     | integer | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_one :order


## orders テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column         | Type      | Options                        |
| ---------------| ----------| ------------------------------ |
| post_cord      | string    | null: false                    |
| send_area_id   | integer   | null: false                    |
| discription    | string    | null: false                    |
| city           | string    | null: false                    |
| address_detail | string    | null: false                    |
| apart_name_num | string    |                                |
| phone_number   | string    | null: false                    |
| user_id        | references| null: false, foreign_key: true |


### Association

- belongs_to :order
