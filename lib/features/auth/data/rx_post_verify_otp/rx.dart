// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:training_app/helpers/toast.dart';

import '../../../../../networks/rx_base.dart';
import 'api.dart';

final class PostVerifyOTPRx extends RxResponseInt<Map> {
  final api = PostVerifyOTPApi.instance;

  PostVerifyOTPRx({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> postVerifyOTPRx({
    required String email,
    required int otp,
  }) async {
    try {
      Map data = await api.postVerifyOTPApi(
        email: email,
        otp: otp,
      );
      handleSuccessWithReturn(data);
      return true;
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }

  @override
  handleErrorWithReturn(dynamic error) {
    if (error is DioException) {
      if (error.response!.statusCode == 401) {
        ToastUtil.showShortToast(error.response!.data["message"]);
      } else {
        ToastUtil.showShortToast(error.response!.data["message"]);
      }
    }
    log(error.toString());
    dataFetcher.sink.addError(error);
    return false;
  }
}
