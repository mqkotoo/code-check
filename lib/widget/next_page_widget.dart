import 'package:code_check/theme/theme.dart';
import 'package:flutter/material.dart';

class verDetailElement extends StatelessWidget {
  const verDetailElement({
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
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(bottom: size.height * 0.01),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: iconBackgroundColor,
            child: Icon(icon,size: size.height * 0.027,color: iconColor),
          ),
          SizedBox(width: size.width * 0.034),
          Text(elementLabel,style: TextStyle(fontSize: size.height * 0.019)),
          Spacer(),
          Text(
            element,
            style: TextStyle(fontSize: size.height * 0.019),
          )
        ],
      ),
    );
  }
}


class horiDetailElement extends StatelessWidget {
  const horiDetailElement({
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
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(bottom: size.width * 0.03),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: iconBackgroundColor,
            child: Icon(icon,color: iconColor),
          ),
          SizedBox(width: size.width * 0.025),
          Text(elementLabel,style: TextStyle(fontSize: size.width * 0.019)),
          SizedBox(width: size.width * 0.035),
          Text(
            element,
            style: TextStyle(fontSize: size.width * 0.019),
          )
        ],
      ),
    );
  }
}

Widget verRepositoryDetail(BuildContext context,
    {required String userIcon,
      required String repoTitle,
      required String? repoDescription}) {

  final Size size = MediaQuery.of(context).size;

  return Column(
    children: [
      Padding(
        padding: EdgeInsets.only(top: size.height * 0.022),
        child: ClipOval(
          child: Image.network(
            userIcon,
            width: size.width * 0.25,
            height: size.width * 0.25,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
        child: Text(
          repoTitle,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: size.height * 0.02),
        ),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(
            size.width * 0.06,
            0,
            size.width * 0.06,
            size.width * 0.016,
        ),
        child: Text(
          repoDescription ?? "No description",
          style: descriptionStyle(context),
        ),
      ),
    ],
  );
}

Widget horiRepositoryDetail(BuildContext context,
    {required String userIcon,
      required String repoTitle,
      required String? repoDescription}) {

  final Size size = MediaQuery.of(context).size;

  return Padding(
    padding: EdgeInsets.symmetric(vertical : size.height * 0.036,horizontal: size.width * 0.11),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ClipOval(
          child: Image.network(
            userIcon,
            width: size.width * 0.1,
            height: size.width * 0.1,
          ),
        ),
        Container(
          width: size.width * 0.5,
          child: Column(
              children : [
                Padding(
                  padding: EdgeInsets.only(bottom : size.height * 0.036),
                  child: Text(
                    repoTitle,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Text(
                  repoDescription ?? "No description",
                  style:descriptionStyle(context),
                ),
              ]
          ),
        ),
      ],
    ),
  );
}

