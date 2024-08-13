import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:suit_media_test_app/data/repository/user_repository_impl.dart';
import 'package:suit_media_test_app/domain/repository/user_repository.dart';
import 'package:suit_media_test_app/utils/exception.dart';
import 'package:suit_media_test_app/utils/failure.dart';

import '../../dummy_data/dummy_object.dart';
import '../../test_helper/test_helper.mocks.dart';

void main() {
  late MockRemoteDatasource mockRemoteDatasource;
  late UserRepository userRepository;

  setUp(() {
    mockRemoteDatasource = MockRemoteDatasource();
    userRepository = UserRepositoryImpl(remoteDatasource: mockRemoteDatasource);
  });

  int tPage = 2;

  group('Get users test', () {
    test('Should get list of users when call to remote data is successful',
        () async {
      //arrange
      when(mockRemoteDatasource.getUsers(tPage))
          .thenAnswer((_) async => [tUserModel]);
      //act
      final result = await userRepository.getUsers(tPage);
      //assert
      final resultList = result.getOrElse(() => []);
      expect(resultList, [tUser]);
    });

    test(
        'Should get ServerFailure when call to remote data throwing ServerException',
        () async {
      //arrange
      when(mockRemoteDatasource.getUsers(tPage)).thenThrow(ServerException());
      //act
      final result = await userRepository.getUsers(tPage);
      //assert
      expect(result, const Left(ServerFailure('')));
    });
  });
}
