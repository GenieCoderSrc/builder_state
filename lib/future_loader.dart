import 'package:flutter/material.dart';
import 'package:state_msg_builder/state_msg_builder.dart';

import 'build_state.dart';


class FutureLoader<T> extends StatelessWidget {
  final Future<T>? future;
  final AsyncWidgetBuilder<T>? onSuccessHasData;
  final AsyncWidgetBuilder<T>? onSuccessNoData;
  final String? noDataTitle;
  final String? errorTitle;
  final AsyncWidgetBuilder<T>? onError;
  final AsyncWidgetBuilder<T>? onWaiting;
  final String? waitingTxt;

  const FutureLoader({super.key, 
    this.future,
    this.onSuccessHasData,
    this.onSuccessNoData,
    this.onError,
    this.onWaiting,
    this.waitingTxt,
    this.noDataTitle,
    this.errorTitle,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
        future: future,
        builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
          if (snapshot.hasError) {
            debugPrint('FutureLoader | snapshot.error" ${snapshot.error}');
            return (onError != null)
                ? onError!(context, snapshot)
                : defaultOnError(context, snapshot.error,
                    errorTitle: errorTitle);
          }
          if (snapshot.hasData) {
            // print('FutureBuilder |onSuccessHasData : ${snapshot.data}');
            return onSuccessHasData!(context, snapshot);
          } else if (snapshot.connectionState == ConnectionState.active &&
              !snapshot.hasData) {
            return (onSuccessNoData != null)
                ? onSuccessNoData!(context, snapshot)
                : NoItemBuilder(title: noDataTitle ?? 'No Item');
          } else {
            return (onWaiting != null)
                ? onWaiting!(context, snapshot)
                : defaultOnWaiting(waitingTxt: waitingTxt);
          }
        });
  }
}
