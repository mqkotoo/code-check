import 'package:code_check/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'view/main_page.dart';

void main() {
  //横画面のUI作ったが画面の向きが変わる際にクラッシュしてしまうので一旦固定
  WidgetsFlutterBinding.ensureInitialized();
  //画面を縦に固定　横向きにならないようにする
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          //ユーザーのデバイスで”文字を大きくする”の設定をしていてもそれにUIを影響させないようにする
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: child!,
        );
      },
      theme: lightTheme,
      darkTheme: darkTheme,
      //テーマの設定をシステムに依存させる
      themeMode: ThemeMode.system,
      //デバッグバナー消す
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}
