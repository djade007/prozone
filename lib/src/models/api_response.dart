import 'package:dio/dio.dart';
import 'package:prozone/src/init.dart';

class ApiResponse<T> {
  final int statusCode;
  final String message;
  final bool succeeded;
  final T data;

  ApiResponse({
    this.statusCode,
    this.message,
    this.succeeded = false,
    this.data,
  });

  bool get failed => !succeeded;

  factory ApiResponse.failed(e, {bool autoNotify: true}) {
    print(e);
    print(StackTrace.current);
    if (e is DioError) {
      if (e.response == null) {
        return ApiResponse(
            message: 'Could not establish secure connection to our servers. '
                'Please check your internet connection an try again.',
            succeeded: false);
      }

      String message = 'Failed. Please try again later';

      print(e.response.data);
      if (e.response.data is Map && e.response.data['message'] != null) {
        message = e.response.data['message'];
      }

      final res = ApiResponse<T>(
        statusCode: e.response.statusCode,
        message: message,
        succeeded: false,
      );

      if (autoNotify) {
        Utils.error(message);
      }

      return res;
    }

    return ApiResponse<T>(
        message: 'An error occurred. Please try again later', succeeded: false);
  }

  factory ApiResponse.success(
    Response response, {
    T data,
    bool autoRoute: true,
  }) {
    print(response.data);

    if (data == null) {
      data = response.data;
    }

    return ApiResponse(
      statusCode: response.statusCode,
      message: response.statusMessage,
      succeeded: true,
      data: data,
    );
  }
}
