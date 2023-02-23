# テーブル設計

## usersテーブル
| Column             | Type       | Options                        |
|:---                |:---        |:---                            |
|nickname            |string      |null: false                     |
|profile             |text        |null: false                     |
|email               |string      |null: false, unique: true       |
|encrypted_password  |string      |null: false                     |
|first_name          |string      |null: false                     |
|last_name           |string      |null: false                     |
|first_name_kana     |string      |null: false                     |
|last_name_kana      |string      |null: false                     |

### Association
has_many :posts
has_one_attached :profile_image

## adminテーブル（管理者機能実装予定）
| Column             | Type       | Options                        |
|:---                |:---        |:---                            |
|email               |string      |null: false, unique: true       |
|encrypted_password  |string      |null: false                     |

### Association
-

## postsテーブル
| Column             | Type       | Options                        |
|:---                |:---        |:---                            |
|title               |string      |null: false                     |
|article             |text        |null: false                     |
|place               |string      |null: false                     |
|link                |string      |                                |
|price               |string      |                                |
|person_id           |integer     |                                |
|user_id             |references  |null: false, foreign_key: true  |

### Association
has_many_attached :images
has_many :comments
belongs_to :user

## commentsテーブル
| Column             | Type       | Options                        |
|:---                |:---        |:---                            |
|user_id             |integer     |null: false                     |
|post_id             |integer     |null: false                     |
|text                |text        |null: false                     |

### Association
belongs_to :user
belongs_to :post

## goodsテーブル（いいね機能実装予定）
| Column             | Type       | Options                        |
|:---                |:---        |:---                            |
|user_id             |references  |null: false                     |
|post_id             |references  |null: false                     |

### Association
belongs_to :user
belongs_to :post

## favoriteテーブル（お気に入り機能実装予定）
| Column             | Type       | Options                        |
|:---                |:---        |:---                            |
|user_id             |references  |null: false                     |
|post_id             |references  |null: false                     |

### Association
belongs_to :user
belongs_to :post