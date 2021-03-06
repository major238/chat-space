*database設計*

## membersテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|group|references|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false,unique: true,index: true|
|email|string|null: false,unique: true|
|password_digest|string|null: false,length: { minimum: 6}|

### Association
- has_many :tweets
- has_many :members
- has_many :groups, through: :members

## tweetsテーブル

|Column|Type|Options|
|------|----|-------|
|content|text||
|image|string||
|user|references|null: false, foreign_key: true|
|group|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group

## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :tweets
- has_many :members
- has_many :users, through: :members
