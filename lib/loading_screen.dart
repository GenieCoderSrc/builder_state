import 'package:flutter/material.dart';
import 'package:app_style/app_style.dart';

class LoadingScreen extends StatelessWidget {
  final String? waitingTxt;

  const LoadingScreen({super.key, this.waitingTxt});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildLoading(waitingTxt: waitingTxt),
    );
  }
}

Widget buildLoading({String? waitingTxt}) {
  return Center(
    child: waitingTxt != null
        ? Text(waitingTxt, style: AppTxtStyles.kSmallTitleBoldTextStyle)
        : const CircularProgressIndicator(),
  );
}
