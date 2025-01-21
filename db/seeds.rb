# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(
  email: "admin@gmail.com",
  password: "password"
)

Genre.create(
  [
  {
    name: "焼き菓子"
  },
  {
    name: "ケーキ"
  },
  {
    name: "プリン"
  },
  {
    name: "キャンディ"
  }
]
)


Item.create(
  [
  {
    genre_id: 1,
    name: "モンブラン",
    caption: "美味しいぞ",
    price: 1900
  },
  {
    genre_id: 2,
    name: " 特性ベイクドチーズケーキ",
    caption: " 高級だけが取り柄の高いケーキ",
    price: 10000
  },
  {
    genre_id: 2,
    name: "いちごのショートケーキ",
    caption: " おひとり様用のデザートにどうぞ",
    price: 400
  },
  {
    genre_id: 2,
    name: "誕生日用ホールケーキ（３名用）",
    caption: "３人祝い用のホールケーキです",
    price: 2700
  },
  {
    genre_id: 3,
    name: "北海道酪農プリン",
    caption: "日本で一番消費されている当店No.1の看板商品！",
    price: 300
  },
  {
    genre_id: 3,
    name: "北海道酪農プリン　お土産用（６個入り）",
    caption: "当店目玉商品のお土産用です",
    price: 1600
  },
  {
    genre_id: 3,
    name: "北海道酪農プリン　お土産用（１０個入り）",
    caption: "当店目玉商品のお土産用です",
    price: 2600
  },
  {
    genre_id: 3,
    name: "北海道酪農プリン　お土産用（１６個入り）",
    caption: "当店目玉商品のお土産用です",
    price: 4300
  },
  {
    genre_id: 4,
    name: "みんな大好きぺろぺろキャンディー",
    caption: "定番のキャンディ",
    price: 200
  },
  {
    genre_id: 4,
    name: "占いキャンディ",
    caption: "袋の裏面に今日のあなたの運勢が書かれているかも",
    price: 230
  },
  {
    genre_id: 4,
    name: "占いキャンディ（パーティー用）",
    caption: "占いキャンディが３０個入っていてパーティーにおすすめ",
    price: 3000
  },
  {
    genre_id: 4,
    name: "でかキャンディ",
    caption: "舐め足りないあなたのために",
    price: 600
  },
  {
    genre_id: 4,
    name: "お豆キャンディー",
    caption: "コーヒーの口直しに爽やかな風味のキャンディーを用意しました",
    price: 100
  },
  {
    genre_id: 4,
    name: "お豆キャンディー袋詰めパック",
    caption: "お豆キャンディー５０個入り",
    price: 3000
  }
]
)

Customer.create(
  [
    {
      last_name: "田中",
      first_name: "将大",
      last_name_kana: "タナカ",
      first_name_kana: "マサヒロ",
      postal_code: "3334444",
      address: "東京都板橋区大山２ー５８",
      phone_number: "050-1111-2222",
      email: "ma-kun@gmail.com",
      encrypted_password: "111111"
    }
  ]
)
