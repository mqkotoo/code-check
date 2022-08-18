# コードチェック
主な参考
    -https://www.udemy.com/course/riverpod/
    -https://zenn.dev/tsuruo/articles/017e405b21412f

## スクリーンショット

|main -light|main -dark|
|---|---|
|![simulator_screenshot_C3BDB8AC-144E-4A46-A32D-641709479160](https://user-images.githubusercontent.com/111117157/185385394-493b019b-c67e-4df4-97f7-919f03d1ec9f.png)|![simulator_screenshot_51EBCD67-9505-4138-A16D-CFD19BAE40FE](https://user-images.githubusercontent.com/111117157/185385211-be1a8e3a-568c-42ec-b7c7-fac52afe0bf3.png)|

|detail -light|detail -dark|
|---|---|
|![simulator_screenshot_7989E781-585A-4DC2-B56A-D3DA4F3377E9](https://user-images.githubusercontent.com/111117157/185385478-b60ef215-1054-4700-835a-af727c5f4da9.png)|![simulator_screenshot_9E7E9993-46C6-4A73-9FB4-6CA6B3001F2D](https://user-images.githubusercontent.com/111117157/185385646-1790dbc1-7196-4deb-b79d-2c4c7d0cb9bf.png)|


## 機能、動作等（進捗）
### 動作
* ~何かしらのキーワードを入力できる~
* ~入力したキーワードで GitHub のリポジトリを検索できる~
* ~GitHub のリポジトリを検索する際、GitHub API（search/repositories）を利用する
  github | Dart Package のようなパッケージは利用せず、API を呼ぶ処理を自分で実装すること~
* ~検索結果は一覧で概要（リポジトリ名）を表示する~
* ~検索結果のアイテムをタップしたら、該当リポジトリの詳細（リポジトリ名、オーナーアイコン、プロジェクト言語、Star 数、Watcher 数、Fork 数、Issue 数）を表示する~

### UI/UX
* エラー発生時の処理
* 画面回転・様々な画面サイズ対応
    -横画面に対応できていないため画面を縦で固定
* ~Theme の適切な利用・ダークモードの対応~
* 多言語対応

## 環境

* IDE: Android Studio Chipmunk | 2021.2.1 Patch 2
* Flutter: 3.0.5
* Dart: 2.17.6

##状態管理

flutter_riverpod: ^1.0.4

##パッケージ

* freezed_annotation: ^2.1.0
* json_annotation: ^4.6.0
* http: ^0.13.5
* flutter_riverpod: ^1.0.4
* intl: ^0.17.0
* build_runner: ^2.2.0
* freezed: ^2.1.0+1
* json_serializable: ^6.3.1



# Note