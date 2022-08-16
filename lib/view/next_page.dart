import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../data/repository_data.dart';
import '../main_page_vm.dart';


class DetailPage extends ConsumerWidget {

  final MainPageVM _vm = MainPageVM();

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    //refを初期化
    _vm.setRef(ref);
    // リポジトリ情報取得
    RepositoryDataItems? data = _vm.tappedRepository;
    //画面サイズ取得
    final Size size = MediaQuery.of(context).size;
    //テーマ別に色を変えられるようにするためのやつ
    final platformBrightness = MediaQuery.platformBrightnessOf(context);

    // データの数をカンマ区切りで表示
    String stars_count = NumberFormat('#,##0').format(data.stargazers_count);
    String watchers_count = NumberFormat('#,##0').format(data.watchers_count);
    String forks_count = NumberFormat('#,##0').format(data.forks_count);
    String issues_count = NumberFormat('#,##0').format(data.open_issues_count);

    return Scaffold(
      backgroundColor:
      platformBrightness == Brightness.dark
          ? Color(0xff1A1C19)
          : Color(0xffFCFDF6),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: platformBrightness == Brightness.dark
                ? Colors.white
                : Colors.black,
          ),
          elevation: 0,
          title:  Text(
              "Repository Detail",
            style: TextStyle(
              color:
              platformBrightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor :
          platformBrightness == Brightness.dark
              ? Color(0xff1A1C19)
              : Color(0xffFCFDF6),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 25),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.network(
                    data.owner.avatar_url,
                    width: size.width * 0.25,
                    height: size.width * 0.25,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(data.full_name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                ),
                Text(
                  data.description ?? "No description",
                  style: TextStyle(
                      color:
                      platformBrightness == Brightness.dark
                      // ? Color(0xff222F22)
                          ? Color(0xffBBBBBB)
                          : Colors.black87,
                  ),
                ),
                Text(data.language ?? "No programing language"),
                Text("star : " + stars_count),
                Text("watch : " + watchers_count),
                Text("fork : " + forks_count),
                Text("issues : " + issues_count),

                Icon(Icons.star,color: Colors.yellowAccent),
                Icon(Icons.language,color: Colors.blueAccent),
                Icon(Icons.remove_red_eye_outlined,color: Colors.brown),
                Icon(Icons.fork_right_sharp,color: Colors.purpleAccent),
                Icon(Icons.info_outline,color: Colors.greenAccent)
              ],
            ),
          ),
        )
    );
  }
}



class CountText extends StatelessWidget {
  const CountText({
    Key? key,
    required this.text,
    required this.data,
    required this.fontsize,
  }) : super(key: key);

  final String? data;
  final String? text;
  final double? fontsize;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text: $data",
      textAlign: TextAlign.start,
      style: TextStyle(fontSize: fontsize),
    );
  }
}
