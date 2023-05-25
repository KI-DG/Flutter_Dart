import 'package:actual_riverpod/model/shopping_item_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ShoppingListProvider =
// 제너릭에게 어떤 StateNotifier를 상속한 class를 사용할지 타입을 넣어주고, 그 class가 관리하는 상태를 넣어줌
    StateNotifierProvider<ShoppingListNotifier, List<ShoppingItemModel>>(
      // 관리할 class를 인스턴스로 만들어주면된다.
  (ref) => ShoppingListNotifier(),
);

// 이걸 Provider로 만들어줘야됨
class ShoppingListNotifier extends StateNotifier<List<ShoppingItemModel>> {
  ShoppingListNotifier()
      : super(
          [
            ShoppingItemModel(
              name: '김치',
              quantity: 3,
              hasBought: false,
              isSpicy: true,
            ),
            ShoppingItemModel(
              name: '라면',
              quantity: 5,
              hasBought: false,
              isSpicy: true,
            ),
            ShoppingItemModel(
              name: '삼겹살',
              quantity: 10,
              hasBought: false,
              isSpicy: false,
            ),
            ShoppingItemModel(
              name: '수박',
              quantity: 2,
              hasBought: false,
              isSpicy: false,
            ),
            ShoppingItemModel(
              name: '뼈짐',
              quantity: 4,
              hasBought: false,
              isSpicy: false,
            ),
          ],
        );
  void toggleHasBought({required String name}) {
    state = state
        .map((e) => e.name == name
            ? ShoppingItemModel(
                name: e.name,
                quantity: e.quantity,
                hasBought: !e.hasBought,
                isSpicy: e.isSpicy,
              )
            : e)
        .toList();
  }
}
