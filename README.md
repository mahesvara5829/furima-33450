# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birthday        | date   | null: false |

### Association

- has_many :items
- has_one :card
- has_one :address



## items テーブル

| Column      | Type    | Options                        |
| ------------| ------- | ------------------------------ |
| image       | Active Storageを利用する                   |
| name        | string  | null: false                    |
| discription | string  | null: false                    |
| category    | string  | null: false                    |
| status      | string  | null: false                    |
| send_fee    | string  | null: false                    |
| send_area   | string  | null: false                    |
| send_days   | string  | null: false                    |
| price       | string  | null: false                    |
| user_id     | integer | null: false, foreign_key: true |


### Association
- belongs_to :user



## cards テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user_id    | integer    | null: false, foreign_key: true |
| customer_id| references | null: false, foreign_key: true |
| card_id    | references | null: false, foreign_key: true |


### Association

- belongs_to :user


## addresses テーブル

| Column         | Type      | Options                        |
| ---------------| ----------| ------------------------------ |
| post_cord      | integer   | null: false                    |
| prefectures    | string    | null: false                    |
| discription    | string    | null: false                    |
| city           | string    | null: false                    |
| address_detail | string    | null: false                    |
| apart_name_num | string    |                                |
| phone_number   | string    |                                |
| user_id        | references| null: false, foreign_key: true |


### Association

- belongs_to :user
