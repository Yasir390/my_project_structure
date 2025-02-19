// // ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:training_app/constants/app_constants.dart';
import 'package:training_app/features/auth/data/rx_login/api.dart';
import 'package:training_app/features/auth/model/login_response_model.dart';
import 'package:training_app/networks/dio/dio.dart';

import '../../../../../helpers/di.dart';
import '../../../../../helpers/toast.dart';
import '../../../../../networks/rx_base.dart';

final class GetLoginRX extends RxResponseInt<LoginResponseModel> {
  final api = LogInApi.instance;

  GetLoginRX({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  /// Returns `true` on success and `false` on error
  Future<bool> getLoginRX({
    required String email,
    required String password,
  }) async {
    try {
      LoginResponseModel data = await api.logIn(
        email: email,
        password: password,
      );
      handleSuccessWithReturn(data);
      return true; // Return true on success
    } catch (error) {
      handleErrorWithReturn(error);
      return false; // Return false on error
    }
  }

  @override
  handleSuccessWithReturn(LoginResponseModel data) {
    ToastUtil.showShortToast("Sign In Success");
    appData.write(kKeyAccessToken, data.token);
    appData.write(kKeyIsLoggedIn, true);
    String token = appData.read(kKeyAccessToken);
    DioSingleton.instance.update(token);
    dataFetcher.sink.add(data);
  }

  @override
  handleErrorWithReturn(dynamic error) {
    if (error is DioException) {
      if (error.response?.statusCode == 422) {
        ToastUtil.showShortToast(error.response?.data["message"] ?? "Error");
      } else {
        ToastUtil.showShortToast(error.response?.data["message"] ?? "Error");
      }
    } else {
      ToastUtil.showShortToast("An unexpected error occurred.");
    }
    log(error.toString());
    dataFetcher.sink.addError(error);
  }
}



// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:rxdart/rxdart.dart';
// import 'package:training_app/constants/app_constants.dart';
// import 'package:training_app/features/auth/data/rx_login/api.dart';
// import 'package:training_app/features/auth/model/login_response_model.dart';
// import 'package:training_app/networks/dio/dio.dart';

// import '../../../../../helpers/di.dart';
// import '../../../../../helpers/toast.dart';
// import '../../../../../networks/rx_base.dart';

// final class GetLoginRX extends RxResponseInt<LoginResponseModel> {
//   final api = LogInApi.instance;

//   GetLoginRX({required super.empty, required super.dataFetcher});

//   ValueStream get getFileData => dataFetcher.stream;

//   Future<bool> getLoginRX({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       LoginResponseModel data = await api.logIn(
//         email: email,
//         password: password,
//       );
//       handleSuccessWithReturn(data);
//       return true;
//     } catch (error) {
//       handleErrorWithReturn(error);
//       return false;
//     }
//   }

//   @override
//   handleSuccessWithReturn(LoginResponseModel data) {
//     ToastUtil.showShortToast("Sign In Success");
//     appData.write(kKeyAccessToken, data.token);
//     appData.write(kKeyIsLoggedIn, true);
//     String token = appData.read(kKeyAccessToken);
//     DioSingleton.instance.update(token);
//     dataFetcher.sink.add(data);
//     return data;
//   }

//   @override
//   handleErrorWithReturn(dynamic error) {
//     if (error is DioException) {
//       if (error.response!.statusCode == 422) {
//         ToastUtil.showShortToast(error.response!.data["message"]);
//       } else {
//         ToastUtil.showShortToast(error.response!.data["message"]);
//       }
//     }
//     log(error.toString());
//     dataFetcher.sink.addError(error);
//     // throw error;
//     return false;
//   }
// }
