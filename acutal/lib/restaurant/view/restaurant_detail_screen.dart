import 'package:acutal/common/const/data.dart';
import 'package:acutal/common/dio/dio.dart';
import 'package:acutal/common/layout/default_layout.dart';
import 'package:acutal/product/component/product_card.dart';
import 'package:acutal/restaurant/component/restaurant_card.dart';
import 'package:acutal/restaurant/model/restaurant_detail_model.dart';
import 'package:acutal/restaurant/repository/restaurant_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RestaurantDetailScreen extends StatelessWidget {
  final String id;

  const RestaurantDetailScreen({
    required this.id,
    Key? key,
  }) : super(key: key);

  Future<RestaurantDetailModel> getRestaurantDetail() async {
    final dio = Dio();

    dio.interceptors.add(
      CustomInterceptor(
        storage: storage,
      ),
    );

    final repository = RestaurantRepository(dio, baseUrl: 'http://$ip/restaurant');

    return repository.getRestaurantDetail(id: id);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: '불타는 떡뽁이',
        child: FutureBuilder<RestaurantDetailModel>(
          future: getRestaurantDetail(),
          builder: (_, AsyncSnapshot<RestaurantDetailModel> snapshot) {

            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return CustomScrollView(
              slivers: [
                rendTop(
                  model: snapshot.data!,
                ),
                rendeLable(),
                renderProduct(products: snapshot.data!.products),
              ],
            );
          },
        ));
  }

  SliverPadding rendeLable() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverToBoxAdapter(
        child: Text(
          '메뉴',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  SliverPadding renderProduct({
    required List<RestaurantProductModel> products,
  }) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          final model = products[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ProductCard.fromModel(
              model: model,
            ),
          );
        }, childCount: products.length),
      ),
    );
  }

  SliverToBoxAdapter rendTop({
    required RestaurantDetailModel model,
  }) {
    return SliverToBoxAdapter(
      child: RestaurantCard.fromModel(
        model: model,
        isDetail: true,
      ),
    );
  }
}
