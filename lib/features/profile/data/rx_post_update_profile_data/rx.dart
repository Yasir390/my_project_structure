// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:training_app/helpers/toast.dart';

import '../../../../../networks/rx_base.dart';
import 'api.dart';

final class PostUpdateProfileRx extends RxResponseInt<Map> {
  final api = PostUpdateProfileDataApi.instance;

  PostUpdateProfileRx({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> postUpdateProfileRx({
    required String name,
    required String dateOfBirth,
    required String position,
    required String preferredFoot,
    required String favouritePlayer,
    required String favouriteClub,
    required String club,
  }) async {
    try {
      Map data = await api.postUpdateProfileDataApi(
        name: name,
        dateOfBirth: dateOfBirth,
        position: position,
        preferredFoot: preferredFoot,
        favouritePlayer: favouritePlayer,
        favouriteClub: favouriteClub,
        club: club,
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
      if (error.response!.statusCode == 400) {
        ToastUtil.showShortToast(error.response!.data["error"]);
      } else {
        ToastUtil.showShortToast(error.response!.data["message"]);
      }
    }
    log(error.toString());
    dataFetcher.sink.addError(error);
    return false;
  }
}
