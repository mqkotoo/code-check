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
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:20.0),
                child: ClipOval(
                  child: Image.network(
                    data.owner.avatar_url,
                    width: size.width * 0.25,
                    height: size.width * 0.25,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(data.full_name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25,0,25,15),
                child: Text(
                  data.description ?? "No description",
                  style: TextStyle(
                      color:
                      platformBrightness == Brightness.dark
                          ? Color(0xffBBBBBB)
                          : Colors.black87,
                  ),
                ),
              ),
              Divider(
                thickness: 0.5,
                color:
                platformBrightness == Brightness.dark
                    ? Color(0xff777777)
                    : Colors.black12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 25),
                child: Column(
                  children: [
                    detailElement(icon: Icons.language, elementLabel: "Language", element: data.language ?? "No Programing language", iconBackgroundColor: Colors.blueAccent, iconColor: Colors.white,),
                    detailElement(icon: Icons.star_border, elementLabel: "Star", element: stars_count, iconBackgroundColor: Colors.yellowAccent, iconColor: Colors.black87,),
                    detailElement(icon: Icons.remove_red_eye_outlined, elementLabel: "Watch", element: watchers_count, iconBackgroundColor: Colors.brown, iconColor: Colors.white,),
                    detailElement(icon: Icons.fork_right_sharp, elementLabel: "Fork", element: forks_count, iconBackgroundColor: Colors.purpleAccent, iconColor: Colors.white,),
                    detailElement(icon: Icons.info_outline, elementLabel: "Issue", element: issues_count, iconBackgroundColor: Colors.greenAccent, iconColor: Colors.white,),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}



class detailElement extends StatelessWidget {
  const detailElement({
    Key? key,
    required this.icon,
    required this.elementLabel,
    required this.element,
    required this.iconBackgroundColor,
    required this.iconColor
  }) : super(key: key);

  final IconData icon;
  final String elementLabel;
  final String element;
  final Color iconBackgroundColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: iconBackgroundColor,
              child: Icon(icon,size: 25,color: iconColor),
          ),
          SizedBox(width: 14),
          Text(elementLabel,style: TextStyle(fontSize: 17)),
          Spacer(),
          Text(
            element,
            style: TextStyle(fontSize: 17),
          )
        ],
      ),
    );
  }
}
