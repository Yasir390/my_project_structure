// ignore_for_file: unused_import

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:training_app/features/auth/model/signup_response_model.dart';
import 'package:training_app/networks/endpoints.dart';

import '../../../../../../helpers/toast.dart';
import '../../../../../../networks/dio/dio.dart';
import '../../../../../../networks/exception_handler/data_source.dart';

final class SignUpApi {
  static final SignUpApi _singleton = SignUpApi._internal();
  SignUpApi._internal();
  static SignUpApi get instance => _singleton;

  Future<SignUpResponseModel> signUpApi({
    required String name,
    required String email,
    required String dateOfBirth,
    required String gender,
    required String clubName,
    required String positionName,
    required String preferredFoot,
    required String favoriteClubName,
    required String favoritePlayerName,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      Map data = {
        "name": name,
        "email": email,
        "date_of_birth": dateOfBirth,
        "gender": gender,
        "club": clubName,
        "position": positionName,
        "preferred_foot": preferredFoot,
        "favourite_club": favoriteClubName,
        "favourite_player": favoritePlayerName,
        "password": password,
        "password_confirmation": confirmPassword,
      };

      Response response = await postHttp(Endpoints.signUpEndpoint(), data);

      if (response.statusCode == 200) {
        final data = SignUpResponseModel.fromJson(response.data);
        ToastUtil.showShortToast("Sign Up Successful");
        return data;
      } else {
        // ToastUtil.showShortToast("Anything wrong");
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      // Handle generic errors
      // throw ErrorHandler.handle(error).failure.responseMessage;
      rethrow;
    }
  }
}
