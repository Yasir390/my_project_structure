import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:training_app/networks/endpoints.dart';
import 'package:training_app/networks/exception_handler/data_source.dart';
import '../../../../../networks/dio/dio.dart';

final class PostSendOTPApi {
  static final PostSendOTPApi _singleton = PostSendOTPApi._internal();
  PostSendOTPApi._internal();
  static PostSendOTPApi get instance => _singleton;

  Future<Map> postSendOTPApi({
    required String email,
  }) async {
    try {
      FormData data = FormData.fromMap({
        "email": email,
      });

      Response response = await postHttp(Endpoints.sendOTPEndPoint(), data);

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
