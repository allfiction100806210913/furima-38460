# README

## users table

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nick_name          | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| last_name          | text   | null: false |
| first_name         | text   | null: false |
| last_name_kana     | text   | null: false |
| first_name_kana    | string | null: false |
| birth              | string | null: false |


### Association

- has_many :purchase_records
- has_many :items

## items table

| Column                  | Type   | Options     |
| ----------------------- | ------ | ----------- |
| item_name               | string | null: false |
| item_text               | string | null: false |
| item_category           | string | null: false |
| item_status             | text   | null: false |
| shipping_status         | text   | null: false |
| item_prefecture         | text   | null: false |
| item_scheduled_delivery | string | null: false |
| price                   | string | null: false |
| user_id                 | references | null: false |

### Association

- belongs_to :user
- has_many :purchase_records
- has_one :order

## orders table

| Column                  | Type   | Options     |
| ----------------------- | ------ | ----------- |
| postal_code             | string | null: false |
| prefecture              | string | null: false |
| city                    | string | null: false |
| building                | text   | null: false |
| addresses               | text   | null: false |
| phone_number            | text   | null: false |
| item_id                 | references | null: false |


### Association

- belongs_to :purchase_record
- belongs_to :item

## purchase_record table

| Column                  | Type       | Options     |
| ----------------------- | ---------- | ----------- |
| user_id                 | references | null: false |
| item_id                 | references | null: false |


### Association

- has_one :purchase_record
- belongs_to :item
- belongs_to :user


































This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
