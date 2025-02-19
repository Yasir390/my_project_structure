import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:training_app/constants/app_constants.dart';
import 'package:training_app/helpers/di.dart';
import 'package:training_app/networks/endpoints.dart';
import 'package:training_app/networks/exception_handler/data_source.dart';
import '../../../../../networks/dio/dio.dart';

final class PostResetPasswordApi {
  static final PostResetPasswordApi _singleton =
      PostResetPasswordApi._internal();
  PostResetPasswordApi._internal();
  static PostResetPasswordApi get instance => _singleton;

  Future<Map> postResetPasswordApi({
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      FormData data = FormData.fromMap({
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation,
      });

      Response response =
          await postHttp(Endpoints.resetPasswordEndPoint(), data);

      if (response.statusCode == 200) {
        final data = json.decode(json.encode(response.data));
        await appData.write(kKeyIsLoggedIn, false);
        await appData.write(kKeyAccessToken, '');
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
