import 'package:actual_riverpod/layout/default_layout.dart';
import 'package:actual_riverpod/riverpod/auto_dispose_modifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AutoDisposeModifierScreen extends ConsumerWidget {
  const AutoDisposeModifierScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(autoDisposeModifier);

    return DefaultLayOut(
        title: 'AutoDisposeModifierScreen',
        body: Center(
          child: state.when(
            data: (data) => Text(
              data.toString(),
            ),
            error: (err, stack) => Text(
              err.toString(),
            ),
            loading: () => CircularProgressIndicator(),
          ),
        ));
  }
}
