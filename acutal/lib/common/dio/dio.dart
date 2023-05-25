import 'package:acutal/common/const/data.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CustomInterceptor extends Interceptor {
  final FlutterSecureStorage storage;

  CustomInterceptor({
    required this.storage,
  });

  // 1) 요청을 보낼때
  // 요청이 보내질때 마다
  // 만약에 요청의 Hearder에 accessToken이 true라는 값이 있다면
  // 실제 토큰을 가져와서 (storage)에서 authorization : Bearer $token으로
  // 해더 변경을 한다
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.headers['accessToken'] == 'true') {
      // 해더 삭제
      options.headers.remove('accessToken');

      final token = await storage.read(key: ACCESS_TOKEN_KEY);

      options.headers.addAll({
        'authorization': 'Bearer $token',
      });
    }

    if (options.headers['refreshToken'] == 'true') {
      // 해더 삭제
      options.headers.remove('refreshToken');

      final token = await storage.read(key: REFRESH_TOKEN_KEY);

      options.headers.addAll({
        'authorization': 'Bearer $token',
      });
    }

    return super.onRequest(options, handler);
  }

  //2) 응답을 받을때
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {

    return super.onResponse(response, handler);
  }

  //3) 에러가 났을때
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    // 401 에러가 났을때 (status code)
    // 토큰을 재발급 받는 시도를 하고 토큰이 재발급되면
    // 다시 새로운 요청을 한다.

    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    // refreshToken이 없으면 당연히 에러를 던진다.
    if (refreshToken == null) {
      //에러를 던질때는 handler.reject를 사용한다.
      return handler.reject(err);
    }
    final isStatus401 = err.response?.statusCode == 401;
    final isPathRefresh = err.requestOptions.path == '/auth/token';

    if (isStatus401 && isPathRefresh) {
      final dio = Dio();

      try{
        final resp = await dio.post(
          'http://$ip/auth/token',
          options: Options(
            headers: {
              'authorization': 'Bearer $refreshToken',
            },
          ),
        );
        final accessToken = resp.data['accessToken'];

        final options = err.requestOptions;
        options.headers.addAll({
          'authorization' : 'Bearer $accessToken'
        });

        await storage.write(key: ACCESS_TOKEN_KEY, value: accessToken);
        // 요청 재전송
        final response = await dio.fetch(options);

        return handler.resolve(response);

      } on DioError catch(e){
        return handler.reject(e);
      }
    }
    return handler.reject(err);
  }
}
