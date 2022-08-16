import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repository_data.dart';
import '../main_page_vm.dart';


class DetailPage extends ConsumerWidget {

  final MainPageVM _vm = MainPageVM();

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    _vm.setRef(ref);

    RepositoryDataItems? data = _vm.tappedRepository;

    final Size size = MediaQuery.of(context).size;

    //テーマ別に色を変えられるようにするためのやつ
    final platformBrightness = MediaQuery.platformBrightnessOf(context);

    return Scaffold(
      backgroundColor:
      platformBrightness == Brightness.dark
          ? Color(0xff1A1C19)
          : Color(0xffFCFDF6),
        appBar: AppBar(
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
              ClipOval(
                child: Image.network(
                  data.owner.avatar_url,
                  width: size.width * 0.3,
                  height: size.width * 0.3,
                ),
              ),
              Text(data.full_name),
              Text(data.description ?? "No description"),
              Text(data.language ?? "No programing language"),
              Text("star : " + data.stargazers_count.toString()),
              Text("watch : " +data.watchers_count.toString()),
              Text("fork : " +data.forks_count.toString()),
              Text("issues : " +data.open_issues_count.toString()),
              Icon(Icons.star,color: Colors.yellowAccent),
              Icon(Icons.language,color: Colors.blueAccent),
              Icon(Icons.remove_red_eye_outlined,color: Colors.brown),
              Icon(Icons.fork_right_sharp,color: Colors.purpleAccent),
              Icon(Icons.info_outline,color: Colors.greenAccent)
            ],
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
