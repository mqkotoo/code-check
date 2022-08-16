import 'package:flutter/material.dart';

class detailElement extends StatelessWidget {
  const detailElement({
    Key? key,
    required this.icon,
    required this.elementLabel,
    required this.element,
    required this.iconBackgroundColor,
    required this.iconColor
  }) : super(key: key);

  final IconData icon;
  final String elementLabel;
  final String element;
  final Color iconBackgroundColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: iconBackgroundColor,
            child: Icon(icon,size: 25,color: iconColor),
          ),
          SizedBox(width: 14),
          Text(elementLabel,style: TextStyle(fontSize: 17)),
          Spacer(),
          Text(
            element,
            style: TextStyle(fontSize: 17),
          )
        ],
      ),
    );
  }
}

Widget repositoryDetail(BuildContext context,
    {required String userIcon,
      required String repoTitle,
      required String? repoDescription}) {
  final platformBrightness = MediaQuery.platformBrightnessOf(context);
  final Size size = MediaQuery.of(context).size;
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: ClipOval(
          child: Image.network(
            userIcon,
            width: size.width * 0.25,
            height: size.width * 0.25,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Text(
          repoTitle,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(25, 0, 25, 15),
        child: Text(
          repoDescription ?? "No description",
          style: TextStyle(
            color: platformBrightness == Brightness.dark
                ? Color(0xffBBBBBB)
                : Colors.black87,
          ),
        ),
      ),
    ],
  );
}

