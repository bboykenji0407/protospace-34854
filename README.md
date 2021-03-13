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

# users テーブル

| column | type | option |
|----------|------|--------|
| email    |string|NOT NULL|
|password  |string|NOT NULL|
|name      |string|NOT NULL|
|profile   |text  |NOT NULL|
|occupation|text  |NOT NULL|
|position  | text |NOT NULL|

### Association
- 
- has_many :prototype
### - has_many :prototype_users
### - has_many :prototypes, through: prototype_users
- has_many :comments

# prototypes テーブル

| column   | type | option |
|----------|------|--------|
| title    |string|NOT NULL|
|catch_copy|text  |NOT NULL|
|concept   |text  |NOT NULL|
# | image  |ActiveStorage|
|user      |references|

### Association
- belongs_to :user
### - has_many :prototype_users
### - has_many :users, through: prototype_users
- has_many :comments


## prototype_users テーブル

| column  | type     | options   |
|---------|----------|-----------|
| user    |references|NOT NULL   |
|prototype|references|NOT NULL   |

### Association

- belongs_to :user
- belongs_to :prototype

# comments テーブル

| column  | type | option |
|---------|------|--------|
|  text   |text  |NOT NULL|
|  user   |references|
|prototype|references|

### Association

- belongs_to :user
- belongs_to :prototype

