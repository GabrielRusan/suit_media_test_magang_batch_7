import 'package:dio/dio.dart';
import 'package:suit_media_test_app/data/models/user_model.dart';
import 'package:suit_media_test_app/data/models/user_model_response.dart';
import 'package:suit_media_test_app/utils/exception.dart';

abstract class RemoteDatasource {
  Future<List<UserModel>> getUsers([int startPage = 1]);
}

class RemoteDatasourceImpl implements RemoteDatasource {
  final Dio dio;

  const RemoteDatasourceImpl({required this.dio});

  final String baseUrl = 'https://reqres.in/api';

  @override
  Future<List<UserModel>> getUsers([int startPage = 1]) async {
    Map<String, dynamic> queryParameters = {
      'page': '$startPage',
      'per_page': '10',
    };

    final response =
        await dio.get('$baseUrl/users', queryParameters: queryParameters);
    if (response.statusCode == 200) {
      return UserModelResponse.fromJson(response.data).data;
    } else {
      throw ServerException();
    }
  }
}
