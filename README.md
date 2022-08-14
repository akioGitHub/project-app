# README

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

# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| sex_id             | integer | null: false               |
| birthday           | date    | null: false               |

### Association

- has_many :projects, through: :affiliations
- has_many :tasks, through: :processes
- has_many :rooms, through: :entering_the_rooms
- has_many :messages


## projects テーブル

| Column                 | Type    | Options     |
| ---------------------- | ------- | ----------- |
| title                  | string  | null: false |
| first_detail           | text    | null: false |
| second_detail          | text    |             |
| category_id            | integer | null: false |
| select_donation_id     | integer | null: false |
| donation_target_amount | integer |             |
| prefecture_id          | integer |             |

### Association

- has_many :users, through: :affiliations
- has_many :rooms
- has_many :donations
- has_many :tasks
- has_one :bank


## banks テーブル

| Column          | Type       | Options                        |
| --------------- | --------   | ------------------------------ |
| bank_name_id    | integer    | null: false                    |
| account_name    | string     | null: false                    |
| account_number  | string     | null: false                    |
| branch_code     | string     | null: false                    |
| deposit_type_id | integer    | null: false                    |
| project         | references | null: false, foreign_key: true |

### Association

- belongs_to :project


## affiliations テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| project | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :project


## tasks テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| title    | string     | null: false                    |
| item     | text       | null: false                    |
| deadline | date       | null: false                    |
| project  | references | null: false, foreign_key: true |

### Association

- has_many :users, through: :processes
- belongs_to :project


## processes テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| task   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :task


## donations テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| price   | integer    | null: false                    |
| project | references | null: false, foreign_key: true |

### Association

- belongs_to :project
- has_one :address


## addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| municipalities | string     | null: false                    |
| house_number   | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| donation       | references | null: false, foreign_key: true |

### Association

- belongs_to :donation


## rooms テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| room_name | string     | null: false                    |
| project   | references | null: false, foreign_key: true |

### Association

- has_many :users, through: :entering_the_rooms
- has_many :messages
- belongs_to :project


## entering_the_rooms テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room


## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | text       | null: false                    |
| room    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room