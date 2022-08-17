# コードチェック
主な参考
    -https://www.udemy.com/course/riverpod/
    -https://zenn.dev/tsuruo/articles/017e405b21412f

## スクリーンショット

|main -light|main -dark|
|---|---|
| ![simulator_screenshot_83734F98-20D6-4647-8CA8-C09FD09CAAB5](https://user-images.githubusercontent.com/111117157/185021035-16a948a9-82ad-4505-a88b-50515aac9ae0.png) |![simulator_screenshot_4C809B3A-BC1C-4824-BE61-A289CF3029A1](https://user-images.git|

|detail -light|detail -dark|
|---|---|
|![simulator_screenshot_83734F98-20D6-4647-8CA8-C09FD09CAAB5](https://user-images.githubusercontent.com/111117157/185021035-16a948a9-82ad-4505-a88b-50515aac9ae0.png)
|![simulator_screenshot_4C809B3A-BC1C-4824-BE61-A289CF3029A1](https://user-images.git
|


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