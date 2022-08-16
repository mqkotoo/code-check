import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../main_page_vm.dart';
import '../widget/main_page_widget.dart';


class MainPage extends ConsumerStatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  MainPageVM _vm = MainPageVM();

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
            searchField(context, onFieldSubmitted: (text) => _vm.onRepositoryDataChanged(text)),
            Divider(
                thickness: 0.5,
                color:
                platformBrightness == Brightness.dark
                    ? Color(0xff777777)
                    : Colors.black12,
            ),
            (() {
              if (data.value != null && data.value!.total_count != 0) {
                //resultをカンマ区切りで表示
                String total_count = NumberFormat('#,##0').format(data.value!.total_count);
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text("result: ${total_count}"),
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

            //ここ何でダメなのかわからない
            // showResultCount(repoData: data.value, repoCount: data.value!.total_count),

            Expanded(
              child: data.when(
                data: (data) => ListView.separated(
                  itemCount: data.items.length,
                  itemBuilder: (context,index) =>
                      repositoryListTile(
                        fullName: data.items[index].full_name,
                        description: data.items[index].description,
                        fetchData: () => _vm.onListTapped(data.items[index]),
                      ),
                  separatorBuilder: (context, index) =>
                  Divider(color: Color(0xffBBBBBB),)
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



