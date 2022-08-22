import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../main_page_vm.dart';
import '../widget/main_page_widget.dart';
import 'next_page.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  final MainPageVM _vm = MainPageVM();

  @override
  void initState() {
    super.initState();
    _vm.setRef(ref);
  }

  @override
  Widget build(BuildContext context) {
    //リポジトリのデータ取得
    final data = _vm.repositoryDataWithFamily(_vm.repositoryData);

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("GitHub Searcher"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            searchField(context,
                onFieldSubmitted: (text) => _vm.onRepositoryDataChanged(text)),
            const Divider(),

            (() {
              if (data.value != null && data.value!.total_count != 0) {
                //resultをカンマ区切りで表示
                String totalCount =
                    NumberFormat('#,##0').format(data.value!.total_count);
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: SafeArea(child: Text("result: $totalCount")),
                  ),
                );
              }
              if (data.value != null && data.value!.total_count == 0) {
                return const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Align(
                    alignment: AlignmentDirectional.centerEnd,
                    //横画面にした時にノッチで隠れないようにsafeareaで囲む
                    child: SafeArea(child: Text("result: 0")),
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            })(),

            //ここ何でダメなのかわからない
            // showResultCount(repoData: data.value, repoCount: data.value!.total_count),

            Expanded(
              flex: 8,
              child: data.when(
                data: (data) => ListView.separated(
                    itemCount: data.items.length,
                    itemBuilder: (context, index) => RepositoryListTile(
                          fullName: data.items[index].full_name,
                          description: data.items[index].description,
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
                        ),
                    separatorBuilder: (context, index) => const Divider(
                          color: Color(0xffBBBBBB),
                        )),
                error: (error, stack) => Text(error.toString()),
                loading: () => Center(
                  child: SizedBox(
                    width: size.height * 0.11,
                      height: size.height * 0.11,
                      child: const CircularProgressIndicator(),
                  ),
                ),
              ),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
