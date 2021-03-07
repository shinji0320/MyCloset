# MyCloset


## 概要

クローゼットの中をWebで管理できるアプリです。  
持っている服をWebで把握できます。  
コーディネートを保存できたり、今日の天気を確認できたり、服選びがスムーズになります。  

<img width="1449" alt="スクリーンショット 2021-03-04 14 07 27" src="https://user-images.githubusercontent.com/66851090/109914308-06eca000-7cf3-11eb-8637-1119a54e2e91.png">


### テーマを選んだ理由
クローゼットの中に一度も着ていない服があったからです。

***なぜ、着ていないのか？***
- 買うときは、気に入って買いましたが家に帰って着てみると合わせる服が無くて  
今度着ようと思いそのまま忘れてしまっていました。

***改善策***
1. 買う前にクローゼットの中の服が確認できれば買うときに必要のない服を買わずに済む。
1. 買う前にクローゼットの中の服が確認できれば合わせる服を一緒に買う事ができる。

このように考えましたので作成することになりました。

### ターゲットユーザ
- 10〜30代くらいのショッピングが好きな女性

## 主な利用シーン
- 今日の天気・気温を確認し、服を選ぶ事ができます。
- ウインドショッピング中に気に入った服があった時、  
自身が持っている服と合わすことが出来るか確認できたり、同じものを持ってないか把握できる。
- クローゼットの中のおすすめの服をどの店で買ったかなどを掲載し、ユーザー同士で教えあうことができます。

## 設計書

[ワイヤーフレーム](https://xd.adobe.com/view/e86a3f4f-e31e-469a-8532-e0df241d5585-bd39/)  
[ER図](https://app.diagrams.net/#G1ciL2UjRAVujDVFKF2kFhLc84BEua-1P9)  
[テーブル定義書](https://docs.google.com/spreadsheets/d/1ZDqj3qq5zncNYNZmOahXYLYmWQqtLxjFxLruldG2CU0/edit?usp=sharing)  
[アプリケーション詳細設計](https://docs.google.com/spreadsheets/d/1FinqAkHowUu_CVKUsqRTsY3JZBOoBqONf_JNxL1l67k/edit#gid=0)  

## 機能一覧
**主要な機能**

1. ユーザー認証
1. コメント機能（非同期通信）
1. いいね機能（非同期通信）
1. フォロー機能（非同期通信）
1. 検索機能
1. ランキング
1. コーディネート機能
1. おすすめの商品を表示( cron使用 )
1. 天気予報( WebAPI使用 )
1. Rspec

[機能詳細](https://docs.google.com/spreadsheets/d/1NbPF5B69iJEW0Z0_ILl9c5klG89ri9GAAvSrNYTnAcM/edit#gid=0)

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML, CSS, JavaScript, Ruby, SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

## 使用素材
O-DAN https://o-dan.net/ja/