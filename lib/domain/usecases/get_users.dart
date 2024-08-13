import 'package:dartz/dartz.dart';
import 'package:suit_media_test_app/domain/entities/user.dart';
import 'package:suit_media_test_app/domain/repository/user_repository.dart';
import 'package:suit_media_test_app/utils/failure.dart';

class GetUsers {
  final UserRepository repository;

  GetUsers({required this.repository});

  Future<Either<Failure, List<User>>> execute([int startPage = 1]) =>
      repository.getUsers(startPage);
}
