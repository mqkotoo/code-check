import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'main_page_vm.dart';


class MainPage extends ConsumerStatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {

  MainPageVM _vm = MainPageVM();

  //検索内容保持するため
  final TextEditingController _searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _vm.setRef(ref);
  }

  @override
  Widget build(BuildContext context) {

    final data = _vm.repositoryDataWithFamily(_vm.repositoryData);

    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _searchTextController,
            ),
            ElevatedButton(onPressed: () =>  _vm.onRepositoryDataChanged(_searchTextController.text),
              child: Text('検索'),
            ),
            // Text("検索結果数" + data.value!.total_count.toString()),
            Expanded(
              child: data.when(
                data: (data) => ListView.separated(
                  itemCount: data.items.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 3,horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom:7),
                          child: Text(
                            data.items[index].full_name,
                            style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          data.items[index].description ?? "No description",
                          style: TextStyle(color: Colors.black87),
                        ),
                        Row(
                          children: [
                            Text(data.items[index].language ?? ""),
                            Text(data.items[index].stargazers_count.toString()),
                          ],
                        )
                      ],
                    ),
                  ), separatorBuilder: (context,index) => Divider(color: Colors.black),
                ),
                error: (error,stack) => Text(error.toString()),
                loading: () => AspectRatio(
                  aspectRatio:1,
                  child: const CircularProgressIndicator(),
                ),
              ),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}