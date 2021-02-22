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
            name: "まほちゃん",
            email: "maho@example.com",
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
            introduction: "普段はドレスしかきてません"
        },
        {
            name: "タコちゃん",
            email: "taco@example.com",
            password: "111111",
            introduction: "お店経営してます。[taco_shop]"
        },
        {
            name: "ねねちゃん",
            email: "nene@example.com",
            password: "111111",
            introduction: "可愛い系の洋服が好きです"
        },
        {
            name: "いくらちゃん",
            email: "ikura@example.com",
            password: "111111",
            introduction: "カジュアルな服装が好きです。合わせやすい服を探してます"
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
            private: "true"
            # image: File.open("./app/assets/images/simple.jpg", 'r')
        },
        {
            genre_id: "2",
            user_id: "2",
            name: "赤のダウン",
            shop_name: "GU",
            detail: "5000円なのにとても暖かいので買った方がいいです",
            private: "true"
        },
        {
            genre_id: "3",
            user_id: "3",
            name: "赤のボトムス",
            shop_name: "GU",
            detail: "安くて買ったけど合わせる服がない",
            private: "false"
        },
        {
            genre_id: "4",
            user_id: "4",
            name: "赤のパーカー",
            shop_name: "GU",
            detail: "セール品だったコスパ最高です",
            private: "false"
        },
        {
            genre_id: "2",
            user_id: "5",
            name: "赤のスニーカー",
            shop_name: "GU",
            detail: "スタイルがよく見える",
            private: "true"
        },
        {
            genre_id: "3",
            user_id: "4",
            name: "赤のワンピース",
            shop_name: "GU",
            detail: "近所の散歩する時に楽で便利",
            private: "true"
        },
        {
            genre_id: "3",
            user_id: "2",
            name: "赤のベレー帽",
            shop_name: "GU",
            detail: "990円でコスパ最高です",
            private: "false"
        },
        {
            genre_id: "1",
            user_id: "1",
            name: "青のジャケット",
            shop_name: "GU",
            detail: "全然寒くなくてとてもいい",
            private: "false"
        },
        {
            genre_id: "1",
            user_id: "2",
            name: "青のダウン",
            shop_name: "wego",
            detail: "柄が可愛い",
            private: "true"
        },
        {
            genre_id: "2",
            user_id: "3",
            name: "青のパーカー",
            shop_name: "wego",
            detail: "合わせやすい一枚あるだけで着回しが効く",
            private: "true"
        },
        {
            genre_id: "5",
            user_id: "4",
            name: "青のTシャツ",
            shop_name: "wego",
            detail: "夏はずっと愛用中",
            private: "false"
        },
        {
            genre_id: "2",
            user_id: "5",
            name: "青のネクタイ",
            shop_name: "wego",
            detail: "とてもお気に入り",
            private: "false"
        },
        {
            genre_id: "3",
            user_id: "4",
            name: "青のスカート",
            shop_name: "GU",
            detail: "合わせやすくてとてもいい",
            private: "true"
        },
        {
            genre_id: "3",
            user_id: "2",
            name: "青のジーンズ",
            shop_name: "wego",
            detail: "990円でコスパ最高です",
            private: "true"
        },
        {
            genre_id: "4",
            user_id: "3",
            name: "黄色のパーカー",
            shop_name: "mac",
            detail: "お気に入りです",
            private: "false"
        },
        {
            genre_id: "3",
            user_id: "4",
            name: "黄色のダウン",
            shop_name: "nike",
            detail: "このマークが可愛い",
            private: "false"
        },
        {
            genre_id: "2",
            user_id: "1",
            name: "黄色のジャケット",
            shop_name: "GU",
            detail: "1290円でセール中で安かったー",
            private: "true",
        },
        {
            genre_id: "1",
            user_id: "1",
            name: "黄色のシャツ",
            shop_name: "GU",
            detail: "大阪にいった時に買いました",
            private: "true"
        },
        {
            genre_id: "2",
            user_id: "2",
            name: "黄色のボトムス",
            shop_name: "GU",
            detail: "新宿限定らしいです",
            private: "true"
        },
        {
            genre_id: "3",
            user_id: "3",
            name: "黄色のワンピース",
            shop_name: "GU",
            detail: "一つあるだけで全然違う",
            private: "true"
        },
        {
            genre_id: "4",
            user_id: "4",
            name: "黄色のヒール",
            shop_name: "GU",
            detail: "履きやすくて三足も買っちゃった",
            private: "true"
        },
        {
            genre_id: "2",
            user_id: "5",
            name: "ピンクのコート",
            shop_name: "GU",
            detail: "めっちゃ可愛い",
            private: "true"
        },
        {
            genre_id: "3",
            user_id: "4",
            name: "ピンクのニット",
            shop_name: "GU",
            detail: "4000円でコスパ最高です",
            private: "false"
        },
        {
            genre_id: "3",
            user_id: "2",
            name: "ピンクのニット帽子",
            shop_name: "GU",
            detail: "990円でコスパ最高です",
            private: "false"
        },
        {
            genre_id: "1",
            user_id: "1",
            name: "ピンクのニット",
            shop_name: "GU",
            detail: "1990円でコスパ最高です",
            private: "false"
        },
        {
            genre_id: "1",
            user_id: "2",
            name: "ピンクのボトムス",
            shop_name: "wego",
            detail: "柄が可愛い",
            private: "true"
        },
        {
            genre_id: "2",
            user_id: "3",
            name: "ピンクのスカート",
            shop_name: "wego",
            detail: "めちゃ可愛いおすすめ",
            private: "true"
        },
        {
            genre_id: "5",
            user_id: "4",
            name: "ピンクのシューズ",
            shop_name: "abc-mart",
            detail: "今、セール中で安いですよ",
            private: "false"
        },
        {
            genre_id: "2",
            user_id: "5",
            name: "花柄のニット",
            shop_name: "Deco",
            detail: "古着屋さんで買いました",
            private: "true"
        },
        {
            genre_id: "3",
            user_id: "4",
            name: "花柄のワンピース",
            shop_name: "GU",
            detail: "1年前くらいに買いました",
            private: "true"
        },
        {
            genre_id: "3",
            user_id: "2",
            name: "花柄のスカート",
            shop_name: "wego",
            detail: "2年前くらい買いました",
            private: "true"
        },
        {
            genre_id: "4",
            user_id: "3",
            name: "花柄のボトムス",
            shop_name: "mac",
            detail: "お気に入りです",
            private: "true"
        },
        {
            genre_id: "3",
            user_id: "4",
            name: "花柄のシャツ",
            shop_name: "nike",
            detail: "カーディガンと合わせるといい感じー",
            private: "true"
        },
        {
            genre_id: "2",
            user_id: "1",
            name: "花柄のくつ",
            shop_name: "GU",
            detail: "ワンピースに合わせるのがおすすめ",
            private: "false"
        }
    ]
)

