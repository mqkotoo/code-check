import 'package:code_check/theme/theme.dart';
import 'package:flutter/material.dart';

class RepositoryListTile extends StatelessWidget {
  const RepositoryListTile({
    Key? key,
    required this.fullName,
    required this.description,
    required this.onTap

  }) : super(key: key);

  final String fullName;
  final String? description;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: size.height * 0.008),
              child: Text(
                fullName,
                style: size.height > size.width
                    ? TextStyle(fontSize: size.height * 0.019, fontWeight: FontWeight.bold)
                    : Theme.of(context).textTheme.subtitle2,
              ),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: size.height * 0.008),
              child: Text(
                description ?? "No description",
                style: descriptionStyle(context),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),
          ],
        ),
        onTap: onTap,
    );
  }
}


Widget searchField(BuildContext context,{required void Function(String) onFieldSubmitted}) {
  final size = MediaQuery.of(context).size;
  return Padding(
    padding:  EdgeInsets.symmetric(vertical: size.height * 0.016,horizontal: size.width * 0.048),
    child: TextFormField(
      style: size.height > size.width
          ? TextStyle(fontSize: size.height * 0.016)
          :const TextStyle(),
      //入力キーボードのdone→searchに変更
      textInputAction: TextInputAction.search,
      //search押したらデータ取得
      onFieldSubmitted: onFieldSubmitted,
    ),
  );
}

// Widget showResultCount({required repoData, required int repoCount}) {
//   if (repoData != null && repoCount != 0) {
//     //resultをカンマ区切りで表示
//     String total_count = NumberFormat('#,##0').format(repoCount);
//     return Padding(
//       padding: const EdgeInsets.only(right: 10),
//       child: Align(
//         alignment: AlignmentDirectional.centerEnd,
//         child: Text("result: ${total_count}"),
//       ),
//     );
//   }
//   if (repoData != null && repoCount == 0) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 10),
//       child: Align(
//         alignment: AlignmentDirectional.centerEnd,
//         child: Text("result: 0"),
//       ),
//     );
//   } else {
//     return const SizedBox.shrink();
//   }
// }