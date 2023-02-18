# テーブル設計

## usersテーブル
| Column             | Type       | Options                        |
|:---                |:---        |:---                            |
|nickname            |string      |null: false                     |
|email               |string      |null: false, unique: true       |
|encrypted_password  |string      |null: false                     |
|first_name          |string      |null: false                     |
|last_name           |string      |null: false                     |
|first_name_kana     |string      |null: false                     |
|last_name_kana      |string      |null: false                     |

### Association
has_many :posts

## adminテーブル（管理者機能実装予定）
| Column             | Type       | Options                        |
|:---                |:---        |:---                            |
|email               |string      |null: false, unique: true       |
|encrypted_password  |string      |null: false                     |

### Association
---

## postsテーブル
| Column             | Type       | Options                        |
|:---                |:---        |:---                            |
|title               |string      |null: false                     |
|article             |text        |null: false                     |
|place               |string      |null: false                     |
|price               |text        |                                |
|person_id           |integer     |                                |
|user                |references  |null: false, foreign_key: true  |

### Association
has_many_attached :image
belongs_to :user

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