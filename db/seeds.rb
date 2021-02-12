# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Genre.create!(
    [
        {
            name: "アウター"
        },
        {
            name: "トップス"
        },
        {
            name: "ボトムス"
        },
        {
            name: "スカート"
        },
        {
            name: "ワンピース"
        },
        {
            name: "シューズ"
        }
    ]
)
User.create!(
    [
        {
            name: "test",
            email: "1@1",
            password: "111111",
            introduction: "テスト用に作成したデータです"
        },
        {
            name: "ミニーちゃん",
            email: "mini@example.com",
            password: "111111",
            introduction: "休みの日はウィンドウショピングしてます"
        },
        {
            name: "デイジー",
            email: "deig@example.com",
            password: "111111",
            introduction: "趣味は映画でホラー大好きです"
        },
        {
            name: "キャサリン",
            email: "casarin@example.com",
            password: "111111",
            introduction: "持っている服はワンピースが多めなのでワンピースのおすすめ紹介してます"
        },
        {
            name: "ピーチ姫",
            email: "peach@example.com",
            password: "111111",
            introduction: "ドレスしか持っていないわ"
        },
        {
            name: "キノピコ",
            email: "kinopiko@example.com",
            password: "111111",
            introduction: "フォフォフォフォフォ"
        }
    ]
)
Item.create!(
    [
        {
            genre_id: "1",
            user_id: "1",
            name: "赤のスニーカー",
            shop_name:"GU",
            detail: "1990円でコスパ最高です",
            private: "ture"
        },
        {
            genre_id: "2",
            user_id: "1",
            name: "ピンクのワンピース",
            shop_name:"GU",
            detail: "1290円でセール中で安かったー",
            private: "false"
        }
    ]
)
