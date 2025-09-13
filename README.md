# builder_state

`builder_state` is a flexible Flutter package for managing asynchronous UI states with ease. It provides a customizable widget to handle states like loading, success, error, and empty data.

## Features

- **Loading Screen:** Displays a loading spinner or custom waiting text during data fetching.
- **Error Handling:** Shows a customizable error screen based on different error types.
- **No Data Screen:** Displays a custom message when no data is available.
- **Customizable UI:** Easily extendable for custom success, error, and waiting states.

## Getting Started

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  builder_state: <latest_version>
```

Then run:

```bash
flutter pub get
```

## Usage

```dart
import 'package:builder_state/builder_state.dart';

FutureLoader<String>(
  future: myAsyncFunction(),
  onWaiting: (context, snapshot) => LoadingScreen(waitingTxt: 'Loading...'),
  onSuccessHasData: (context, snapshot) => SuccessScreen(data: snapshot.data!),
  onError: (context, snapshot) => ErrorScreen(error: snapshot.error),
  onSuccessNoData: (context, snapshot) => NoDataScreen(),
)
```

### Customizing States
You can customize the loading, error, and empty data states as follows:

```dart
Widget defaultOnWaiting({String? waitingTxt}) =>
  LoadingScreen(waitingTxt: waitingTxt);

Widget defaultOnError(BuildContext context, Object? error, {String? errorTitle}) =>
  _buildError(context, error, errorTitle);

Widget _buildError(BuildContext context, Object? error, String? errorTitle) {
  String errorMsg;
  if (errorTitle != null) {
    errorMsg = errorTitle;
  } else if (error.toString().contains('permission-denied')) {
    errorMsg = 'No Permission';
  } else if (error == null || error.toString().contains('unknown')) {
    errorMsg = 'No Internet';
  } else {
    errorMsg = 'Internet Connection Failed';
  }
  return buildNoItem(title: errorMsg);
}
```

## API Reference

### FutureLoader
- `future`: *(Future<T>)* The future to be awaited.
- `onSuccessHasData`: *(AsyncWidgetBuilder<T>)* Widget displayed when data is available.
- `onSuccessNoData`: *(AsyncWidgetBuilder<T>)* Widget displayed when no data is available.
- `onError`: *(AsyncWidgetBuilder<T>)* Widget displayed on error.
- `onWaiting`: *(AsyncWidgetBuilder<T>)* Widget displayed during loading.
- `waitingTxt`: *(String?)* Custom text shown in the loading state.

## Example

```dart
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Builder State Example'),
      ),
      body: Center(
        child: FutureLoader<String>(
          future: fetchData(),
          onWaiting: (context, snapshot) => LoadingScreen(waitingTxt: 'Fetching data...'),
          onSuccessHasData: (context, snapshot) => Text('Data: ${snapshot.data}'),
          onError: (context, snapshot) => Text('Error: ${snapshot.error}'),
          onSuccessNoData: (context, snapshot) => const NoItemScreen(),
        ),
      ),
    );
  }
}

Future<String> fetchData() async {
  await Future.delayed(const Duration(seconds: 2));
  return 'Hello, World!';
}
```

## License

This project is licensed under the MIT License.

## Contributions

Feel free to open an issue or submit a pull request. Contributions are always welcome!