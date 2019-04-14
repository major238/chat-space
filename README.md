*database設計*

## membersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|handle_name|string|null: false, length: { maximum: 15}|
|email|string|null: false,unique: true|
|password_digest|string|null: false,length: { minimum: 6}|
|tweet_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- has_many :tweets, through: :members
- has_many :groups, through: :members

## tweetsテーブル

|Column|Type|Options|
|------|----|-------|
|tweet|text|null: false,length: { maximum: 125}|
|timestamp|timestamp|null: false|
|temp_file|text|null: true|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group

## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|groupname|string|null: false,length: { maximum: 15}|
|user_id|integer|null: false, foreign_key: true|
|tweet_id|integer|null: false, foreign_key: true|

### Association
- has_many :tweets, through: :members
- has_many :users, through: :members
