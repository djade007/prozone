import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:prozone/src/init.dart';
import 'package:dio/dio.dart';
import 'package:dio_flutter_transformer/dio_flutter_transformer.dart';
import 'package:prozone/src/models/api_response.dart';
import 'package:prozone/src/models/provider.dart';
import 'package:prozone/src/models/provider_type.dart';

class Api {
  static const _token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNTk0MTgzMzUwLCJleHAiOjE1OTY3NzUzNTB9.SS17FWeuomLQxAqyIEiPk0hTjLcKjh91XpM6U2X7dkM';

  static Dio _dio({bool auth = true}) {
    // configure dio
    final dio = Dio(BaseOptions(
      baseUrl: 'https://pro-zone.herokuapp.com/',
    ));

    dio.transformer = FlutterTransformer();

    if (auth) {
      dio.options.headers = {
        "Authorization": 'Bearer $_token',
      };
    }

    return dio;
  }

  static Future<Response<T>> _get<T>(String path, [bool cache = true]) {
    return _dio().get(
      path,
    );
  }

  static Future<ApiResponse> providerTypes() async {
    try {
      final res = await _get(
        'provider-types',
      );
      return ApiResponse.success(res);
    } catch (e) {
      return ApiResponse.failed(e);
    }
  }

  static Future<ApiResponse> states() async {
    try {
      final res = await _get(
        'states',
      );
      return ApiResponse.success(res);
    } catch (e) {
      return ApiResponse.failed(e);
    }
  }

  static Future<ApiResponse<List<Provider>>> providers([String query = '']) async {
    try {
      final res = await _get(
        'providers?$query',
      );
      final data = Provider.resolveList(res.data);
      return ApiResponse.success(res, data: data);
    } catch (e) {
      return ApiResponse.failed(e);
    }
  }

  static Future<ApiResponse> createProvider(Map<String, dynamic> data) async {
    try {
      final res = await _dio().post(
        'providers',
        data: data,
      );

      return ApiResponse.success(res);
    } catch (e) {
      return ApiResponse.failed(e);
    }
  }

  static uploadImage() {}
}
