import 'package:actual_riverpod/layout/default_layout.dart';
import 'package:actual_riverpod/riverpod/state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watch 어떤 값이 변경되었을때 다시 빌드가 실행하고 싶을 경우 watch를 사용
    // riverPod은 따로 안넘겨줘도 데이터를 값을 공유 할 수 있다. 똑같이 변경됨
    final provider = ref.watch(numberProvider);

    return DefaultLayOut(
      title: 'StateProviderScreen',
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(provider.toString()),
            ElevatedButton(
              onPressed: () {
                // 눌렀을때 실행되는 경우는 read // 값을 바꾸고 싶을떄는 .notifier를 붙여줘야된다.
                ref.read(numberProvider.notifier).update((state) => state + 1);
              },
              child: Text('UP'),
            ),
            ElevatedButton(
              onPressed: () {
                // 눌렀을때 실행되는 경우는 read // 값을 바꾸고 싶을떄는 .notifier를 붙여줘야된다.
                ref.read(numberProvider.notifier).state =
                    ref.read(numberProvider.notifier).state - 1;
              },
              child: Text('DOWN'),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => _NextScreen(),
                  ));
                },
                child: Text('NextScreen'))
          ],
        ),
      ),
    );
  }
}

class _NextScreen extends ConsumerWidget {
  const _NextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(numberProvider);

    return DefaultLayOut(
      title: 'StateProviderScreen',
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(provider.toString()),
            ElevatedButton(
                onPressed: () {
                  // 눌렀을때 실행되는 경우는 read
                  ref
                      .read(numberProvider.notifier)
                      .update((state) => state + 1);
                },
                child: Text('UP'))
          ],
        ),
      ),
    );
  }
}
