import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:suit_media_test_app/data/datasources/remote_datasource.dart';
import 'package:suit_media_test_app/utils/exception.dart';

import '../../dummy_data/dummy_object.dart';
import '../../json_reader.dart';
import '../../test_helper/test_helper.mocks.dart';

void main() {
  late MockDio mockDio;
  late RemoteDatasource remoteDatasource;

  setUp(() {
    mockDio = MockDio();
    remoteDatasource = RemoteDatasourceImpl(dio: mockDio);
  });

  group('get users test', () {
    test('should get list of users when call to API is successful', () async {
      //arrange
      when(mockDio.get(any, queryParameters: anyNamed('queryParameters')))
          .thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 200,
          data: jsonDecode(
            readJson('dummy_data/user_response_model.json'),
          ),
        ),
      );
      //act
      final result = await remoteDatasource.getUsers();
      //assert
      expect(result, [tUserModel]);
    });

    test('should throw ServerException when call to API is not successful',
        () async {
      //arrange
      when(mockDio.get(any, queryParameters: anyNamed('queryParameters')))
          .thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 501,
          data: {'message': 'Server Error'},
        ),
      );
      //act
      final call = remoteDatasource.getUsers();
      //assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });
}
