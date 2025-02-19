import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:training_app/helpers/toast.dart';
import 'package:training_app/networks/endpoints.dart';
import 'package:training_app/networks/exception_handler/data_source.dart';

import '../../../../../networks/dio/dio.dart';

final class PostUpdateProfileDataApi {
  static final PostUpdateProfileDataApi _singleton =
      PostUpdateProfileDataApi._internal();
  PostUpdateProfileDataApi._internal();
  static PostUpdateProfileDataApi get instance => _singleton;

  Future<Map> postUpdateProfileDataApi({
    required String name,
    required String dateOfBirth,
    required String position,
    required String preferredFoot,
    required String favouritePlayer,
    required String favouriteClub,
    required String club,
  }) async {
    try {
      FormData data = FormData.fromMap({
        'name': name,
        'date_of_birth': dateOfBirth,
        'position': position,
        'preferred_foot': preferredFoot,
        'favourite_player': favouritePlayer,
        'favourite_club': favouriteClub,
        'club': club,
      });
      // if (await File(avatar.path).exists()) {
      //   data.files
      //       .add(MapEntry('avatar', await MultipartFile.fromFile(avatar.path)));
      // }
      Response response =
          await postHttp(Endpoints.profileUpdateEndPoint(), data);

      if (response.statusCode == 200) {
        final data = json.decode(json.encode(response.data));
        ToastUtil.showShortToast("Profile Updated Successfully");
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
