// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:training_app/constants/app_constants.dart';
import 'package:training_app/features/auth/data/rx_post_signup/api.dart';
import 'package:training_app/features/auth/model/signup_response_model.dart';
import 'package:training_app/networks/dio/dio.dart';
import 'package:training_app/networks/rx_base.dart';
import '../../../../../../helpers/di.dart';
import '../../../../../../helpers/toast.dart';

final class SignUpRx extends RxResponseInt<SignUpResponseModel> {
  final api = SignUpApi.instance;

  SignUpRx({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> signUpRx({
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
      SignUpResponseModel data = await api.signUpApi(
        name: name,
        email: email,
        dateOfBirth: dateOfBirth,
        gender: gender,
        clubName: clubName,
        positionName: positionName,
        preferredFoot: preferredFoot,
        favoriteClubName: favoriteClubName,
        favoritePlayerName: favoritePlayerName,
        password: password,
        confirmPassword: confirmPassword,
      );
      handleSuccessWithReturn(data);
      return true;
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(SignUpResponseModel data) {
    appData.write(kKeyAccessToken, data.accessToken);
    appData.write(kKeyIsLoggedIn, true);
    String token = appData.read(kKeyAccessToken);
    DioSingleton.instance.update(token);
    dataFetcher.sink.add(data);
    return data;
  }

  @override
  handleErrorWithReturn(dynamic error) {
    if (error is DioException) {
      if (error.response!.statusCode == 400) {
        ToastUtil.showShortToast(error.response!.data["message"]);
      } else {
        ToastUtil.showShortToast(error.response!.data["message"]);
      }
    }
    log(error.toString());
    dataFetcher.sink.addError(error);
    // throw error;
    return false;
  }
}
