# MyCloset

## サイト概要

クローゼットの中の服を可視化できます。
持っている服の中でコーディネートを保存できますので服選びの時間が短縮できます。
天気を確認できますので、服選びがスムーズになります。
おすすめの服を共有しあうことができます。

<img width="1153" alt="スクリーンショット 2021-02-22 15 48 30" src="https://user-images.githubusercontent.com/66851090/108672752-f33c7f00-7525-11eb-8d2d-0ab25b468152.png">
<img width="1406" alt="スクリーンショット 2021-02-22 15 51 04" src="https://user-images.githubusercontent.com/66851090/108672819-08191280-7526-11eb-81bf-81150fe94611.png">

## サイトテーマ
洋服好きの女性のための管理サイト

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
- ワイヤーフレーム
https://xd.adobe.com/view/e86a3f4f-e31e-469a-8532-e0df241d5585-bd39/
- ER図
https://app.diagrams.net/#G1ciL2UjRAVujDVFKF2kFhLc84BEua-1P9
- テーブル定義書
https://docs.google.com/spreadsheets/d/1ZDqj3qq5zncNYNZmOahXYLYmWQqtLxjFxLruldG2CU0/edit?usp=sharing
- アプリケーション詳細設計
https://docs.google.com/spreadsheets/d/1FinqAkHowUu_CVKUsqRTsY3JZBOoBqONf_JNxL1l67k/edit#gid=0

## 機能一覧
https://docs.google.com/spreadsheets/d/1NbPF5B69iJEW0Z0_ILl9c5klG89ri9GAAvSrNYTnAcM/edit#gid=0

**主要な機能**
- ログイン機能
- コメント機能（非同期通信）
- いいね機能（非同期通信）
- フォロー機能（非同期通信）
- 検索機能
- ランキング
- コーディネート機能
- おすすめの商品を表示
- 天気予報

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

## 使用素材
- O-DAN https://o-dan.net/ja/