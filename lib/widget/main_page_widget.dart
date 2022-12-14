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


class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    required this.onFieldSubmitted,
  }) : super(key: key);

  final void Function(String) onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: size.height * 0.016,horizontal: size.width * 0.048),
      child: TextFormField(
        style: size.height > size.width
            ? TextStyle(fontSize: size.height * 0.016)
            :const TextStyle(),
        //????????????????????????done???search?????????
        textInputAction: TextInputAction.search,
        //search???????????????????????????
        onFieldSubmitted: onFieldSubmitted,
      ),
    );
  }
}


// Widget showResultCount({required repoData, required int repoCount}) {
//   if (repoData != null && repoCount != 0) {
//     //result??????????????????????????????
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