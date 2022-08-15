import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repository_data.dart';
import '../main_page_vm.dart';


class DetailPage extends ConsumerWidget {
  final MainPageVM _vm = MainPageVM();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // RepositoryDataItems? data = _vm.tappedRepository;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Repository Detail"),
        ),
        body: Center(
          child: Column(
            children: [
              // Text(data.full_name),
              // Text(data.description ?? "No description"),
              // Text(data.language ?? "No programing language"),
              // Text(data.stargazers_count.toString()),
              // Text(data.forks_count.toString()),
            ],
          ),
        )
    );
  }
}
