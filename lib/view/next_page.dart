import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../data/repository_data.dart';
import '../main_page_vm.dart';
import '../widget/next_page_widget.dart';

class DetailPage extends ConsumerWidget {
  final MainPageVM _vm = MainPageVM();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //refを初期化
    _vm.setRef(ref);

    return Scaffold(
      appBar: AppBar(
        title: Text("Repository Detail"),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return constraints.maxWidth < constraints.maxHeight
              ? verticalScreen(context)
              : horizontalScreen(context);
        },
      ),
    );
  }

  //縦画面用UI
  Widget verticalScreen(BuildContext context) {

    final size = MediaQuery.of(context).size;
    RepositoryDataItems? data = _vm.tappedRepository;

    // データの数をカンマ区切りで表示
    String stars_count = NumberFormat('#,##0').format(data.stargazers_count);
    String watchers_count = NumberFormat('#,##0').format(data.watchers_count);
    String forks_count = NumberFormat('#,##0').format(data.forks_count);
    String issues_count = NumberFormat('#,##0').format(data.open_issues_count);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        verRepositoryDetail(context,
            userIcon: data.owner.avatar_url,
            repoTitle: data.full_name,
            repoDescription: data.description,
        ),
        Divider(),

        Padding(
          padding:
          EdgeInsets.symmetric(vertical: size.height * 0.01, horizontal: size.width * 0.06),
          child: Column(
            children: [
              verDetailElement(
                icon: Icons.language,
                elementLabel: "Language",
                element: data.language ?? "No Programing language",
                iconBackgroundColor: Colors.blueAccent,
                iconColor: Colors.white,
              ),
              verDetailElement(
                icon: Icons.star_border,
                elementLabel: "Star",
                element: stars_count,
                iconBackgroundColor: Colors.yellowAccent,
                iconColor: Colors.black87,
              ),
              verDetailElement(
                icon: Icons.remove_red_eye_outlined,
                elementLabel: "Watch",
                element: watchers_count,
                iconBackgroundColor: Colors.brown,
                iconColor: Colors.white,
              ),
              verDetailElement(
                icon: Icons.fork_right_sharp,
                elementLabel: "Fork",
                element: forks_count,
                iconBackgroundColor: Colors.purpleAccent,
                iconColor: Colors.white,
              ),
              verDetailElement(
                icon: Icons.info_outline,
                elementLabel: "Issue",
                element: issues_count,
                iconBackgroundColor: Colors.greenAccent,
                iconColor: Colors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }

  //横画面用UI
  Widget horizontalScreen(BuildContext context) {


    final size = MediaQuery.of(context).size;
    RepositoryDataItems? data = _vm.tappedRepository;

    // データの数をカンマ区切りで表示
    String stars_count = NumberFormat('#,##0').format(data.stargazers_count);
    String watchers_count = NumberFormat('#,##0').format(data.watchers_count);
    String forks_count = NumberFormat('#,##0').format(data.forks_count);
    String issues_count = NumberFormat('#,##0').format(data.open_issues_count);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          horiRepositoryDetail(context,
              userIcon: data.owner.avatar_url,
              repoTitle: data.full_name,
              repoDescription: data.description,
          ),
          Divider(),

          Padding(
            padding:
            EdgeInsets.symmetric(vertical: size.height * 0.04, horizontal: size.width * 0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    horiDetailElement(
                      icon: Icons.language,
                      elementLabel: "Language",
                      element: data.language ?? "No Programing language",
                      iconBackgroundColor: Colors.blueAccent,
                      iconColor: Colors.white,
                    ),
                    horiDetailElement(
                      icon: Icons.remove_red_eye_outlined,
                      elementLabel: "Watch",
                      element: watchers_count,
                      iconBackgroundColor: Colors.brown,
                      iconColor: Colors.white,
                    ),
                    horiDetailElement(
                      icon: Icons.info_outline,
                      elementLabel: "Issue",
                      element: issues_count,
                      iconBackgroundColor: Colors.greenAccent,
                      iconColor: Colors.white,
                    ),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    horiDetailElement(
                      icon: Icons.star_border,
                      elementLabel: "Star",
                      element: stars_count,
                      iconBackgroundColor: Colors.yellowAccent,
                      iconColor: Colors.black87,
                    ),
                    horiDetailElement(
                      icon: Icons.fork_right_sharp,
                      elementLabel: "Fork",
                      element: forks_count,
                      iconBackgroundColor: Colors.purpleAccent,
                      iconColor: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


