import 'package:flutter_riverpod/flutter_riverpod.dart';

// 자동으로 삭제를 한다. 필요가 없을때 메모리를 삭제함
final autoDisposeModifier = FutureProvider.autoDispose<List<int>>((ref) async {
  await Future.delayed(
    Duration(
      seconds: 2,
    ),
  );

  return [1, 2, 3, 4, 5];
});
