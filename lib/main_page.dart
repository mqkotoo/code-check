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

    //リポジトリのデータ取得
    final data = _vm.repositoryDataWithFamily(_vm.repositoryData);

    bool hasRepositoryData;

    return Scaffold(
      appBar: AppBar(
        title: Text("GitHub Searcher"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _searchTextController,
            ),
            ElevatedButton(onPressed: () =>  _vm.onRepositoryDataChanged(_searchTextController.text),
              child: Text('Search'),
            ),
            // Text("検索結果数" + data.value!.total_count.toString()),
            Divider(thickness: 0.5,color: Colors.black),

            (() {
              if (data.value != null && data.value!.total_count != 0) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text(
                        "result: ${data.value!.total_count}"),
                  ),
                );
              } if(data.value != null && data.value!.total_count == 0 ){
                return const SizedBox.shrink();
              }
              else {
                return const SizedBox.shrink();
              }
            })(),

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
                        Padding(
                          padding: EdgeInsets.only(bottom : 5.0),
                          child: Text(
                            data.items[index].description ?? "No description",
                            style: TextStyle(color: Colors.black87),
                          ),
                        ),
                        Row(
                          children: [
                            Text("🌐"),
                            Text(data.items[index].language ?? "なし"),
                            SizedBox(width: 10),
                            Text("⭐️${data.items[index].stargazers_count}"),
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