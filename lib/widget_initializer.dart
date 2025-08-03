// 📁 widget_initializer.dart

import 'package:flutter/widgets.dart';

/// A reusable widget that calls [onInit] once with the given [args]
/// when the widget is built, then renders [child].
///
/// Useful for initializing Cubits, controllers, or any stateful logic
/// that depends on external data.
///
/// Example usage:
/// ```dart
/// WidgetInitializer<CustomerEntity?>(
///   args: customer,
///   onInit: (customer) => context.read<EditCustomerCubit>().initialize(customer),
///   child: CustomerEditForm(),
/// );
/// ```
class WidgetInitializer<T> extends StatefulWidget {
  final T args;
  final void Function(T args) onInit;
  final Widget child;

  const WidgetInitializer({
    super.key,
    required this.args,
    required this.onInit,
    required this.child,
  });

  @override
  State<WidgetInitializer<T>> createState() => _WidgetInitializerState<T>();
}

class _WidgetInitializerState<T> extends State<WidgetInitializer<T>> {
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      widget.onInit(widget.args);
      _initialized = true;
    }
  }

  @override
  void didUpdateWidget(covariant WidgetInitializer<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.args != oldWidget.args) {
      widget.onInit(widget.args);
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
