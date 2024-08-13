import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:suit_media_test_app/data/models/user_model_response.dart';

import '../../dummy_data/dummy_object.dart';
import '../../json_reader.dart';

void main() {
  group('fromJson test', () {
    test('Should return valid model from json', () {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(readJson('dummy_data/user_response_model.json'));
      // act
      final result = UserModelResponse.fromJson(jsonMap);
      // assert
      expect(result, tUserModelResponse);
    });
  });

  group('toJson test', () {
    test('Should return valid json from model', () {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(readJson('dummy_data/user_response_model.json'));
      // act
      final result = tUserModelResponse.toJson();
      // assert
      expect(result, jsonMap);
    });
  });
}
