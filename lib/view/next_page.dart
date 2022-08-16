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

    return Scaffold(
        appBar: AppBar(
          title: const Text("Repository Detail"),
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
              Text(data.stargazers_count.toString()),
              Text(data.forks_count.toString()),
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
