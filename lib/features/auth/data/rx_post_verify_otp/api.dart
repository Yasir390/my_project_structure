import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:training_app/networks/endpoints.dart';
import 'package:training_app/networks/exception_handler/data_source.dart';

import '../../../../../networks/dio/dio.dart';

final class PostVerifyOTPApi {
  static final PostVerifyOTPApi _singleton = PostVerifyOTPApi._internal();
  PostVerifyOTPApi._internal();
  static PostVerifyOTPApi get instance => _singleton;

  Future<Map> postVerifyOTPApi({
    required String email,
    required int otp,
  }) async {
    try {
      FormData data = FormData.fromMap({
        "email": email,
        "otp": otp,
      });

      Response response = await postHttp(Endpoints.verifyOTPEndPoint(), data);

      if (response.statusCode == 200) {
        final data = json.decode(json.encode(response.data));
        // ToastUtil.showShortToast("Updated Successfully");
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      // Handle generic errors
      rethrow;
    }
  }
}
