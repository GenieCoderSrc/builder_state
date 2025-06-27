import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef SelectedBuilder<T> = Widget Function(T value);
typedef UnselectedBuilder = Widget Function();

class SelectionBuilder<T, S> extends StatelessWidget {
  final BlocBase<S> cubit;
  final T? Function(S state) getSelected;
  final SelectedBuilder<T> selectedBuilder;
  final UnselectedBuilder unselectedBuilder;

  const SelectionBuilder({
    super.key,
    required this.cubit,
    required this.getSelected,
    required this.selectedBuilder,
    required this.unselectedBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocBase<S>, S>(
      bloc: cubit,
      builder: (context, state) {
        final T? selected = getSelected(state);
        return selected != null
            ? selectedBuilder(selected)
            : unselectedBuilder();
      },
    );
  }
}
