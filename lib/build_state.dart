import 'package:flutter/material.dart';
import 'package:state_msg_builder/state_msg_builder.dart';

import 'loading_screen.dart';

Widget defaultOnWaiting({String? waitingTxt}) =>
    LoadingScreen(waitingTxt: waitingTxt);

Widget defaultOnError(BuildContext context, Object? error,
        {String? errorTitle}) =>
    _buildError(context, error, errorTitle);

Widget _buildError(BuildContext context, Object? error, String? errorTitle) {
  String errorMsg;
  if (errorTitle != null) {
    errorMsg = errorTitle;
  } else if (error.toString().contains('permission-denied')) {
    errorMsg = 'No Permission';
  } else if (error == null || error.toString().contains('unknown')) {
    debugPrint('_buildError | error:$error');
    errorMsg = 'No Internet';
  } else {
    debugPrint('_buildError | error:$error');
    errorMsg = 'Internet Connection Failed';
  }

  return NoItemBuilder(title: errorMsg);
}
