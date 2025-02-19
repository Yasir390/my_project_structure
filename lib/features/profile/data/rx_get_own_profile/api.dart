import 'package:dio/dio.dart';
import 'package:training_app/features/profile/model/profile_model.dart';
import 'package:training_app/networks/dio/dio.dart';
import 'package:training_app/networks/endpoints.dart';

import '../../../../../networks/exception_handler/data_source.dart';

final class GetOwnProfileApi {
  static final GetOwnProfileApi _singleton = GetOwnProfileApi._internal();
  GetOwnProfileApi._internal();
  static GetOwnProfileApi get instance => _singleton;

  Future<ProfileModel> getOwnProfileApi() async {
    try {
      Response response = await getHttp(Endpoints.ownProfileEndPoint());

      if (response.statusCode == 200) {
        final data = ProfileModel.fromJson(response.data);
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
