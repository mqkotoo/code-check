import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../view/next_page.dart';

class repositoryListTile extends StatelessWidget {
  const repositoryListTile({
    Key? key,
    required this.fullName,
    required this.description,
    required this.fetchData

  }) : super(key: key);

  final String fullName;
  final String? description;
  final void Function() fetchData;

  @override
  Widget build(BuildContext context) {
    final platformBrightness = MediaQuery.platformBrightnessOf(context);
    return ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom:7.0),
              child: Text(
                fullName,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 7.0),
              child: Text(
                description ?? "No description",
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
          ],
        ),
        onTap: () {
          fetchData;
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return DetailPage();
              },
            ),
          );
        }
    );
  }
}


Widget searchField(BuildContext context,{required void Function(String) onFieldSubmitted}) {
  final platformBrightness = MediaQuery.platformBrightnessOf(context);
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 20),
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
      onFieldSubmitted: onFieldSubmitted,
    ),
  );
}

Widget showResultCount({required repoData, required int repoCount}) {
  if (repoData != null && repoCount != 0) {
    //resultをカンマ区切りで表示
    String total_count = NumberFormat('#,##0').format(repoCount);
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Text("result: ${total_count}"),
      ),
    );
  }
  if (repoData != null && repoCount == 0) {
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
}