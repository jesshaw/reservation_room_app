import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileTitle extends StatelessWidget {
  final title;
  final subTitle;
  final textColor;

  ProfileTitle({this.title, this.subTitle, this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.w700, color: textColor),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          subTitle,
          style: TextStyle(
              fontSize: 15.0, fontWeight: FontWeight.normal, color: textColor),
        ),
      ],
    );
  }
}
