// ignore_for_file: unused_import

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:training_app/features/auth/model/login_response_model.dart';
import 'package:training_app/networks/dio/dio.dart';
import 'package:training_app/networks/endpoints.dart';

import '../../../../../helpers/toast.dart';
import '../../../../../networks/exception_handler/data_source.dart';

final class LogInApi {
  static final LogInApi _singleton = LogInApi._internal();
  LogInApi._internal();
  static LogInApi get instance => _singleton;

  Future<LoginResponseModel> logIn({
    required String email,
    required String password,
  }) async {
    try {
      Map data = {
        "email": email,
        "password": password,
      };

      Response response = await postHttp(Endpoints.loginEndPoint(), data);

      if (response.statusCode == 200) {
        final data = LoginResponseModel.fromJson((response.data));
        ToastUtil.showShortToast("Sign In Successful");
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      // Handle generic errors
      // throw ErrorHandler.handle(error).failure.responseMessage;
      rethrow;
    }
  }
}






// import 'package:dio/dio.dart';
// import 'package:marriedbybec_app/features/auth/model/login_response_model.dart';
// import 'package:marriedbybec_app/networks/dio/dio.dart';
// import 'package:marriedbybec_app/networks/endpoint.dart';

// import '../../../../../helpers/toast.dart';
// import '../../../../../networks/exception_handler/data_source.dart';

// final class LogInApi {
//   static final LogInApi _singleton = LogInApi._internal();
//   LogInApi._internal();
//   static LogInApi get instance => _singleton;

//   Future<LoginResponseModel> logIn({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       Map data = {
//         "email": email,
//         "password": password,
//       };

//       Response response = await postHttp(Endpoints.loginEndPoint(), data);

//       if (response.statusCode == 200) {
//         final data = 
//         LoginResponseModel.fromJson(response.data);
//         ToastUtil.showShortToast("Sign In Successful");
//         return data;
//       } else {
//         throw DataSource.DEFAULT.getFailure();
//       }
//     } catch (error) {
//       // Handle generic errors
//       // throw ErrorHandler.handle(error).failure.responseMessage;
//       rethrow;
//     }
//   }
// }
