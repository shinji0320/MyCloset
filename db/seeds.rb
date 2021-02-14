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
) unless Genre.exists?
User.create!(
    [
        {
            name: "ゲストユーザー",
            email: "guest@example.com",
            password: "SecureRandom.urlsafe_base64",
            introduction: "持っている服がすぐに確認できて服選びが快適!!コーディネートが作れて服選びが楽"
        },
        {
            name: "test",
            email: "1@1",
            password: "111111",
            introduction: "テスト用に作成したデータです"
        },
        {
            name: "りほちゃん",
            email: "riho@example.com",
            password: "111111",
            introduction: "休みの日はウィンドウショピングしてます"
        },
        {
            name: "しんちゃん",
            email: "shinji@example.com",
            password: "111111",
            introduction: "趣味は映画でホラー大好きです"
        },
        {
            name: "姫ちゃん",
            email: "hime@example.com",
            password: "111111",
            introduction: "持っている服はワンピースが多めなのでワンピースのおすすめ紹介してます"
        },
        {
            name: "イカちゃん",
            email: "ika@example.com",
            password: "111111",
            introduction: "ドレスしか持っていないわ"
        },
        {
            name: "タコちゃん",
            email: "taco@example.com",
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
            name: "赤のジャケット",
            shop_name: "GU",
            detail: "1990円でコスパ最高です",
            private: "ture"
        },
        {
            genre_id: "2",
            user_id: "2",
            name: "赤のダウン",
            shop_name: "GU",
            detail: "3000円でコスパ最高です",
            private: "ture"
        },
        {
            genre_id: "3",
            user_id: "3",
            name: "赤のボトムス",
            shop_name: "GU",
            detail: "800円でコスパ最高です",
            private: "ture"
        },
        {
            genre_id: "4",
            user_id: "4",
            name: "赤のパーカー",
            shop_name: "GU",
            detail: "セール品だったコスパ最高です",
            private: "ture"
        },
        {
            genre_id: "2",
            user_id: "5",
            name: "赤のスニーカー",
            shop_name: "GU",
            detail: "スタイルがよく見える",
            private: "ture"
        },
        {
            genre_id: "3",
            user_id: "4",
            name: "赤のワンピース",
            shop_name: "GU",
            detail: "4000円でコスパ最高です",
            private: "ture"
        },
        {
            genre_id: "3",
            user_id: "2",
            name: "赤のベレー帽",
            shop_name: "GU",
            detail: "990円でコスパ最高です",
            private: "ture"
        },
        {
            genre_id: "1",
            user_id: "1",
            name: "青のジャケット",
            shop_name: "GU",
            detail: "1990円でコスパ最高です",
            private: "ture"
        },
        {
            genre_id: "1",
            user_id: "2",
            name: "青のダウン",
            shop_name: "wego",
            detail: "柄が可愛い",
            private: "ture"
        },
        {
            genre_id: "2",
            user_id: "3",
            name: "青のパーカー",
            shop_name: "wego",
            detail: "800円でコスパ最高です",
            private: "ture"
        },
        {
            genre_id: "5",
            user_id: "4",
            name: "青のTシャツ",
            shop_name: "wego",
            detail: "セール品だったコスパ最高です",
            private: "ture"
        },
        {
            genre_id: "2",
            user_id: "5",
            name: "青のネクタイ",
            shop_name: "wego",
            detail: "スタイルがよく見える",
            private: "ture"
        },
        {
            genre_id: "3",
            user_id: "4",
            name: "青のスカート",
            shop_name: "GU",
            detail: "4000円でコスパ最高です",
            private: "ture"
        },
        {
            genre_id: "3",
            user_id: "2",
            name: "青のジーンズ",
            shop_name: "wego",
            detail: "990円でコスパ最高です",
            private: "ture"
        },
        {
            genre_id: "4",
            user_id: "3",
            name: "黄色のパーカー",
            shop_name: "mac",
            detail: "お気に入りです",
            private: "ture"
        },
        {
            genre_id: "3",
            user_id: "4",
            name: "黄色のダウン",
            shop_name: "nike",
            detail: "6990円でコスパ最高です",
            private: "ture"
        },
        {
            genre_id: "2",
            user_id: "1",
            name: "黄色のジャケット",
            shop_name: "GU",
            detail: "1290円でセール中で安かったー",
            private: "false"
        },
         {
            genre_id: "1",
            user_id: "1",
            name: "黄色のシャツ",
            shop_name: "GU",
            detail: "1990円でコスパ最高です",
            private: "ture"
        },
        {
            genre_id: "2",
            user_id: "2",
            name: "黄色のボトムス",
            shop_name: "GU",
            detail: "3000円でコスパ最高です",
            private: "ture"
        },
        {
            genre_id: "3",
            user_id: "3",
            name: "黄色のワンピース",
            shop_name: "GU",
            detail: "800円でコスパ最高です",
            private: "ture"
        },
        {
            genre_id: "4",
            user_id: "4",
            name: "黄色のヒール",
            shop_name: "GU",
            detail: "セール品だったコスパ最高です",
            private: "ture"
        },
        {
            genre_id: "2",
            user_id: "5",
            name: "テラコッタ柄のボトムス",
            shop_name: "GU",
            detail: "スタイルがよく見える",
            private: "ture"
        },
        {
            genre_id: "3",
            user_id: "4",
            name: "黒のスニーカー",
            shop_name: "GU",
            detail: "4000円でコスパ最高です",
            private: "ture"
        },
        {
            genre_id: "3",
            user_id: "2",
            name: "赤のベレー帽",
            shop_name: "GU",
            detail: "990円でコスパ最高です",
            private: "ture"
        },
        {
            genre_id: "1",
            user_id: "1",
            name: "赤のスニーカー",
            shop_name: "GU",
            detail: "1990円でコスパ最高です",
            private: "ture"
        },
        {
            genre_id: "1",
            user_id: "2",
            name: "青のワンピース",
            shop_name: "wego",
            detail: "柄が可愛い",
            private: "ture"
        },
        {
            genre_id: "2",
            user_id: "3",
            name: "黄色のドレス",
            shop_name: "wego",
            detail: "800円でコスパ最高です",
            private: "ture"
        },
        {
            genre_id: "5",
            user_id: "4",
            name: "赤のジャケット",
            shop_name: "wego",
            detail: "セール品だったコスパ最高です",
            private: "ture"
        },
        {
            genre_id: "2",
            user_id: "5",
            name: "豹柄のボトムス",
            shop_name: "wego",
            detail: "スタイルがよく見える",
            private: "ture"
        },
        {
            genre_id: "3",
            user_id: "4",
            name: "黒のスニーカー",
            shop_name: "GU",
            detail: "4000円でコスパ最高です",
            private: "ture"
        },
        {
            genre_id: "3",
            user_id: "2",
            name: "赤のベレー帽",
            shop_name: "wego",
            detail: "990円でコスパ最高です",
            private: "ture"
        },
        {
            genre_id: "4",
            user_id: "3",
            name: "黒のベレー帽",
            shop_name: "mac",
            detail: "お気に入りです",
            private: "ture"
        },
        {
            genre_id: "3",
            user_id: "4",
            name: "ナイキのスニーカー",
            shop_name: "nike",
            detail: "6990円でコスパ最高です",
            private: "ture"
        },
        {
            genre_id: "2",
            user_id: "1",
            name: "ピンクのワンピース",
            shop_name: "GU",
            detail: "1290円でセール中で安かったー",
            private: "false"
        }
    ]
)
