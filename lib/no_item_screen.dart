import 'package:flutter/material.dart';
import 'package:app_style/app_style.dart';

class NoItemScreen extends StatelessWidget {
  const NoItemScreen({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Text(title ?? 'No Item',
                style: AppTxtStyles.kMidTitleTextStyle)));
  }
}

Widget buildNoItem({String title = 'No Item'}) =>
    Center(child: Text(title, style: AppTxtStyles.kMidTitleTextStyle));
