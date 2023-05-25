class ShoppingItemModel {
  // 이름
  final String name;
  // 수량
  final int quantity;
  // 장바구니에 담는지 안담는지 확인
  final bool hasBought;
  // 매운지 안매운지 확인
  final bool isSpicy;

  ShoppingItemModel({
    required this.name,
    required this.quantity,
    required this.hasBought,
    required this.isSpicy,
  });

  ShoppingItemModel copyWith({
    String? name,
    int? quantity,
    bool? hasBought,
    bool? isSpicy,
  }) {
    return ShoppingItemModel(
      // 만약에 name null 이면은 this.name
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      hasBought: hasBought ?? this.hasBought,
      isSpicy: isSpicy ?? this.isSpicy,
    );
  }
}
