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

# アプリケーション名

camp-meshi

# アプリケーションの概要

キャンプで作った料理の写真を投稿することができ、いいね機能やコメント機能を持たせることでユーザーのコミュニティの場を提供致します。<br>
機能として、ユーザー登録、新規投稿、編集、削除、コメント投稿、いいね機能、検索機能、ユーザー詳細ページなどを実装致しました。<br>
ユーザー登録が完了している人のみの機能としてコメント機能、いいね機能ができる様にしております。

# URL

https://campmeshi-36492.herokuapp.com/

# テスト用アカウント

ユーザー名:a<br>
メールアドレス:a@gmail.com<br>
パスワード:aaaaa1

ユーザー名:b<br>
メールアドレス:b@gmail.com<br>
パスワード:bbbbb2

ユーザー名:c<br>
メールアドレス:c@gmail.com<br>
パスワード:ccccc3

# Basic認証

ID:admin<br>
パスワード:2222

# 利用方法

ユーザー登録/ログインをし新規投稿画面から料理の写真を投稿できます。<br>
投稿した人は編集・削除することができます。<br>
検索したい料理を検索すると探したい料理の写真だけ見ることができます。<br>
お気に入りのユーザーができた際にもユーザー詳細ページからそのユーザーだけの写真を見ることでできます。<br>
ユーザー登録を完了している人のみコメントの投稿やいいね機能をすることができます。

# 目指した課題解決

最近キャンプブームということもあり、キャンプをする人が急増してきています。私もそのうちの一人です。<br>
キャンプの料理はキャンプをする醍醐味でもあるため、情報が多い方が何かと助かります。<br>
そこでこのcamp-meshiというアプリを開発することで、実際の写真を閲覧できたり、レシピなども載っているアプリがあったら便利だと感じた為作成致しました。<br>
思い出として投稿したいという方もいると思うので、レシピに関しては無くても投稿できるように改善致しました。<br>
また、作りたい料理が決まっている人向けに検索機能を実装することで効率的にレシピの検索ができる様に致しました。

# 洗い出した要件

https://docs.google.com/spreadsheets/d/1K8LiF20_N0U1HM0Mf3zE0eYIzBapotlAVs4iN4ixcQE/edit#gid=282075926

# 実装した機能について

[![Image from Gyazo](https://i.gyazo.com/74a02d33cb91ce82f17fce4100e77b86.png)](https://gyazo.com/74a02d33cb91ce82f17fce4100e77b86)

検索機能を使用することで、効率よく写真を探すことができます。

[![Image from Gyazo](https://i.gyazo.com/6b340cbb58d572522e487a4e5941c21f.jpg)](https://gyazo.com/6b340cbb58d572522e487a4e5941c21f)

いいね機能を使用することでどのくらいその投稿に人気があるか一目でわかるようにしました。

# ローカルでの動作方法

$ git clone https://git.heroku.com/campmeshi-36492.git
$ cd hoge
$ bundle install
$ rails db:create
$ rails db:migrate
$ rails s
👉 http://localhost:3000

# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

- has_many :tweets
- has_many :comments

## tweetsテーブル

| Column     | Type       | Option                         |
| ---------- | ---------- | ------------------------------ |
| title      | string     | null: false                    |
| body       | text       |                                |
| user       | references | null: false, foreign_key: true |

### Association

- has_many :comments
- belongs_to user

## commentsテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| tweet     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :tweet

## favoritesテーブル

| Column   | Type    | Options     |
| -------- | ------- | ----------- |
| user_id  | integer | null: false |
| tweet_id | integer | null: false |

### Association

- belongs_to :user
- belongs_to :tweet
