# Changelog

All notable changes to this project will be documented in this file.

## 0.0.4
### Added
- Introduced `FutureLoader<T>` widget to simplify `FutureBuilder` handling with:
    - Customizable success state with data (`onSuccessHasData`).
    - Optional handler for success state with no data (`onSuccessNoData`).
    - Custom error state handling via `onError` or fallback to `ErrorMsgBuilder`.
    - Custom waiting state handling via `onWaiting` or fallback to `LoadingScreen`.
- Support for optional titles: `noDataTitle`, `errorTitle`, and waiting message `waitingTxt`.

---
This is the first stable version.



## 0.0.3
### Initial Release
- Removed State Message Builder to reduce package size.

## 0.0.2
### Initial Release
- Added no_item_builder.dart file.


## 0.0.1
### Initial Release
- Added `FutureLoader` widget for managing async data states (loading, success, error, and no data).
- Added `LoadingScreen` widget to display a loading spinner or custom waiting text.
- Added `NoItemScreen` widget to display a "No Item" message when no data is available.
- Included default error and waiting handlers (`defaultOnError` and `defaultOnWaiting`).
- Provided customizations for error, loading, and no data states.
- Integrated with `state_msg_builder` for message rendering.

## Features
- Simplified async state management for Flutter applications.
- Flexible error handling with different error messages.
- Easy integration with `FutureBuilder` to display different states.




