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
        title: const Text("Repository Detail"),
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
    String starsCount = NumberFormat('#,##0').format(data.stargazers_count);
    String watchersCount = NumberFormat('#,##0').format(data.watchers_count);
    String forksCount = NumberFormat('#,##0').format(data.forks_count);
    String issuesCount = NumberFormat('#,##0').format(data.open_issues_count);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        VerRepositoryDetail(
            userIcon: data.owner.avatar_url,
            repoTitle: data.full_name,
            repoDescription: data.description,
        ),
        const Divider(),

        Padding(
          padding:
          EdgeInsets.symmetric(vertical: size.height * 0.01, horizontal: size.width * 0.06),
          child: Column(
            children: [
              VerDetailElement(
                icon: Icons.language,
                elementLabel: "Language",
                element: data.language ?? "No Programing language",
                iconBackgroundColor: Colors.blueAccent,
                iconColor: Colors.white,
              ),
              VerDetailElement(
                icon: Icons.star_border,
                elementLabel: "Star",
                element: starsCount,
                iconBackgroundColor: Colors.yellowAccent,
                iconColor: Colors.black87,
              ),
              VerDetailElement(
                icon: Icons.remove_red_eye_outlined,
                elementLabel: "Watch",
                element: watchersCount,
                iconBackgroundColor: Colors.brown,
                iconColor: Colors.white,
              ),
              VerDetailElement(
                icon: Icons.fork_right_sharp,
                elementLabel: "Fork",
                element: forksCount,
                iconBackgroundColor: Colors.purpleAccent,
                iconColor: Colors.white,
              ),
              VerDetailElement(
                icon: Icons.info_outline,
                elementLabel: "Issue",
                element: issuesCount,
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
    String starsCount = NumberFormat('#,##0').format(data.stargazers_count);
    String watchersCount = NumberFormat('#,##0').format(data.watchers_count);
    String forksCount = NumberFormat('#,##0').format(data.forks_count);
    String issuesCount = NumberFormat('#,##0').format(data.open_issues_count);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HoriRepositoryDetail(
              userIcon: data.owner.avatar_url,
              repoTitle: data.full_name,
              repoDescription: data.description,
          ),
          const Divider(),

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
                    HoriDetailElement(
                      icon: Icons.language,
                      elementLabel: "Language",
                      element: data.language ?? "No Programing language",
                      iconBackgroundColor: Colors.blueAccent,
                      iconColor: Colors.white,
                    ),
                    HoriDetailElement(
                      icon: Icons.remove_red_eye_outlined,
                      elementLabel: "Watch",
                      element: watchersCount,
                      iconBackgroundColor: Colors.brown,
                      iconColor: Colors.white,
                    ),
                    HoriDetailElement(
                      icon: Icons.info_outline,
                      elementLabel: "Issue",
                      element: issuesCount,
                      iconBackgroundColor: Colors.greenAccent,
                      iconColor: Colors.white,
                    ),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HoriDetailElement(
                      icon: Icons.star_border,
                      elementLabel: "Star",
                      element: starsCount,
                      iconBackgroundColor: Colors.yellowAccent,
                      iconColor: Colors.black87,
                    ),
                    HoriDetailElement(
                      icon: Icons.fork_right_sharp,
                      elementLabel: "Fork",
                      element: forksCount,
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


