import 'package:acutal/common/const/data.dart';
import 'package:acutal/common/dio/dio.dart';
import 'package:acutal/restaurant/component/restaurant_card.dart';
import 'package:acutal/restaurant/model/restaurant_model.dart';
import 'package:acutal/restaurant/repository/restaurant_repository.dart';
import 'package:acutal/restaurant/view/restaurant_detail_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({Key? key}) : super(key: key);

  Future<List<RestaurantModel>> paginateRestaurant() async {
    final dio = Dio();

    dio.interceptors.add(
      CustomInterceptor(storage: storage),
    );

    final resp = await RestaurantRepository(
      dio,
      baseUrl: 'http://$ip/restaurant',
    ).pageinate();

    return resp.data;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: FutureBuilder<List<RestaurantModel>>(
              future: paginateRestaurant(),
              builder: (context, AsyncSnapshot<List<RestaurantModel>> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.separated(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) {
                    final pItem = snapshot.data![index];

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
