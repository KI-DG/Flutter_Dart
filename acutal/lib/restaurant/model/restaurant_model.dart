import 'package:acutal/common/const/data.dart';
import 'package:acutal/common/utils/data_utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restaurant_model.g.dart';

enum RestaurantPriceRange {
  expensive,
  medium,
  cheap,
}
// Json으로 자동으로 시켜준다.
@JsonSerializable()
class RestaurantModel {
  final String id;
  final String name;
  @JsonKey(
    fromJson: DateUtils.pathToUrl,
  )
  final String thumbUrl;
  final List<String> tags;
  final RestaurantPriceRange priceRange;
  final int ratingsCount;
  final int deliveryTime;
  final int deliveryFee;
  final double ratings;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.thumbUrl,
    required this.tags,
    required this.priceRange,
    required this.ratingsCount,
    required this.deliveryTime,
    required this.deliveryFee,
    required this.ratings,
  });
  // Json으로 부터 instance 변환
  factory RestaurantModel.fromJson(Map<String, dynamic> json)
  => _$RestaurantModelFromJson(json);
  // 다시 instance로 변환 이건 잘 안쓴다
  Map<String, dynamic> toJson() => _$RestaurantModelToJson(this);


// factory RestaurantModel.fromJson({
//   required Map<String, dynamic> json,
// }) {
//   return RestaurantModel(
//     id: json['id'],
//     name: json['name'],
//     thumbUrl: 'http://$ip${json['thumbUrl']}',
//     tags: List<String>.from(json['tags']),
//     priceRange: RestaurantPriceRange.values
//         .firstWhere((e) => e.name == json['priceRange']),
//     ratingsCount: json['ratingsCount'],
//     deliveryTime: json['deliveryTime'],
//     deliveryFee: json['deliveryFee'],
//     ratings: json['ratings'],
//   );
// }
}
