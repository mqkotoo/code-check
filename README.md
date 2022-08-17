# コードチェック
主な参考
* https://www.udemy.com/course/riverpod/
* https://zenn.dev/tsuruo/articles/017e405b21412f

## スクリーンショット

|main -light|main -dark|
|---|---|
|![simulator_screenshot_273B2C77-294B-4219-BBF3-C998E5A2C705](https://user-images.githubusercontent.com/111117157/185022369-78da316f-a4dc-411d-925b-ec4bb2b62953.png)|![simulator_screenshot_69DB66E3-CEB5-4290-8DAF-86486859BEF4](https://user-images.githubusercontent.com/111117157/185022415-d4b7ecfa-4637-49e9-9407-5462b03873c8.png)|

|detail -light|detail -dark|
|---|---|
|![simulator_screenshot_F57F6A35-F414-4B84-BB0C-7D575D1D7F4B](https://user-images.githubusercontent.com/111117157/185022465-554b6042-494d-46ca-aa77-f91968578d5f.png)|![simulator_screenshot_D5B5CDF9-6D96-4657-A5E3-BF5B71BA3EC7](https://user-images.githubusercontent.com/111117157/185022500-58a3690d-c43e-4034-8390-b98857ced04d.png)|


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
* 画面回転・様々な画面サイズ対応(横画面に対応できていないため画面を縦で固定)
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
