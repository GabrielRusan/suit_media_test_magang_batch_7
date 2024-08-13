import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:suit_media_test_app/domain/usecases/get_users.dart';

import '../../dummy_data/dummy_object.dart';
import '../../test_helper/test_helper.mocks.dart';

void main() {
  late MockUserRepository mockUserRepository;
  late GetUsers getUsers;

  setUp(() {
    mockUserRepository = MockUserRepository();
    getUsers = GetUsers(repository: mockUserRepository);
  });

  test('Should get list of tv from repository when every thing is allright',
      () async {
    // arrange
    when(mockUserRepository.getUsers())
        .thenAnswer((_) async => Right(tUserList));
    // act
    final result = await getUsers.execute();
    // assert
    expect(result, Right(tUserList));
  });
}
