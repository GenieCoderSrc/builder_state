import 'package:flutter/material.dart';
import 'package:builder_state/builder_state.dart';
import 'package:state_msg_builder/state_msg_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Builder State Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Builder State Example')),
      body: Center(
        child: FutureLoader<String>(
          future: fetchData(),
          onWaiting:
              (context, snapshot) =>
                  LoadingScreen(waitingTxt: 'Fetching data...'),
          onSuccessHasData:
              (context, snapshot) => Text('Data: ${snapshot.data}'),
          onError: (context, snapshot) => Text('Error: ${snapshot.error}'),
          onSuccessNoData: (context, snapshot) => const StateMsgScreen(),
        ),
      ),
    );
  }

  Future<String> fetchData() async {
    // Simulate network call with delay
    await Future.delayed(const Duration(seconds: 3));
    // Uncomment the next line to simulate an error
    // throw 'Failed to fetch data!';
    return 'Hello, World!';
  }
}
