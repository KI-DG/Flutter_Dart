import 'package:acutal/common/const/data.dart';
import 'package:acutal/common/dio/dio.dart';
import 'package:acutal/common/model/cursor_pagination_model.dart';
import 'package:acutal/restaurant/component/restaurant_card.dart';
import 'package:acutal/restaurant/model/restaurant_model.dart';
import 'package:acutal/restaurant/repository/restaurant_repository.dart';
import 'package:acutal/restaurant/view/restaurant_detail_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RestaurantScreen extends ConsumerWidget {
  const RestaurantScreen({Key? key}) : super(key: key);

  // Future<List<RestaurantModel>> paginateRestaurant(WidgetRef ref) async {
  //   final dio = ref.watch(dioProvider);
  //
  //   final resp = await RestaurantRepository(
  //     dio,
  //     baseUrl: 'http://$ip/restaurant',
  //   ).pageinate();
  //
  //   return resp.data;
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: FutureBuilder<CursorPagination<RestaurantModel>>(
              future: ref.watch(restaurantRepositoryProvider).pageinate(),
              builder:
                  (context, AsyncSnapshot<CursorPagination<RestaurantModel>> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.separated(
                  itemCount: snapshot.data!.data.length,
                  itemBuilder: (_, index) {
                    final pItem = snapshot.data!.data[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => RestaurantDetailScreen(
                                  id: pItem.id,
                                )));
                      },
                      child: RestaurantCard.fromModel(
                        model: pItem,
                      ),
                    );
                  },
                  separatorBuilder: (_, index) {
                    return SizedBox(
                      height: 16.0,
                    );
                  },
                );
              }),
        ),
      ),
    );
  }
}
