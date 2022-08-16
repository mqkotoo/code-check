import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../main_page_vm.dart';
import 'next_page.dart';

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

    //テーマ別に色を変えられるようにするためのやつ
    final platformBrightness = MediaQuery.platformBrightnessOf(context);

    return Scaffold(
      // extendBodyBehindAppBar: true,
      backgroundColor:
      platformBrightness == Brightness.dark
          ? Color(0xff1A1C19)
          : Color(0xffFCFDF6),
      appBar: AppBar(
        elevation: 0,
        backgroundColor:
        platformBrightness == Brightness.dark
            ? Color(0xff1A1C19)
            : Color(0xffFCFDF6),
        title: Text(
          "GitHub Searcher",
          style: TextStyle(
              color:
              platformBrightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
              fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  fillColor:
                  platformBrightness == Brightness.dark
                      // ? Color(0xff222F22)
                    ? Color(0xff454f45)
                      : Color(0xffe1eedf),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.black87,
                      )),
                ),
                //入力キーボードのdone→searchに変更
                textInputAction: TextInputAction.search,
                //search押したらデータ取得
                onFieldSubmitted: (text) => _vm.onRepositoryDataChanged(text),
              ),
            ),
            // Text("検索結果数" + data.value!.total_count.toString()),
            Divider(thickness: 0.5, color: Colors.black12),

            (() {
              if (data.value != null && data.value!.total_count != 0) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text("result: ${data.value!.total_count}"),
                  ),
                );
              }
              if (data.value != null && data.value!.total_count == 0) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text("result: 0"),
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            })(),

            Expanded(
              child: data.when(
                data: (data) => ListView.separated(
                  itemCount: data.items.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                    child: GestureDetector(
                      onTap: () {
                        _vm.onListTapped(data.items[index]);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailPage();
                            },
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 7),
                            child: Text(
                              data.items[index].full_name,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 5.0),
                            child: Text(
                              data.items[index].description ?? "No description",
                              style: TextStyle(
                                  color:
                                  platformBrightness == Brightness.dark
                                  // ? Color(0xff222F22)
                                      ? Color(0xffBBBBBB)
                                      : Colors.black87,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                          ),
                          Row(
                            children: [
                              Text("⭐️${data.items[index].stargazers_count}"),
                              SizedBox(width: 10),
                              Text("🌐"),
                              Text(data.items[index].language ?? "なし"),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) =>
                      Divider(color: Colors.black),
                ),
                error: (error, stack) => Text(error.toString()),
                loading: () => const CircularProgressIndicator(),
              ),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
