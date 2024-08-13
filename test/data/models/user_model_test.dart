import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:suit_media_test_app/data/models/user_model.dart';
import 'package:suit_media_test_app/domain/entities/user.dart';

import '../../dummy_data/dummy_object.dart';
import '../../json_reader.dart';

void main() {
  group('fromJson test', () {
    test('Should return valid model from json', () {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(readJson('dummy_data/user_model.json'));
      // act
      final result = UserModel.fromJson(jsonMap);
      // assert
      expect(result, tUserModel);
    });
  });

  group('toJson test', () {
    test('Should return valid json from model', () {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(readJson('dummy_data/user_model.json'));
      // act
      final result = tUserModel.toJson();
      // assert
      expect(result, jsonMap);
    });
  });

  group('toEntity test', () {
    test('Should return valid User entity from model', () {
      // arrange
      final User expectedEntity = tUser;
      // act
      final result = tUserModel.toEntity();
      // assert
      expect(result, expectedEntity);
    });
  });
}
