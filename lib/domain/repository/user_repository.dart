import 'package:dartz/dartz.dart';
import 'package:suit_media_test_app/domain/entities/user.dart';
import 'package:suit_media_test_app/utils/failure.dart';

abstract class UserRepository {
  Future<Either<Failure, List<User>>> getUsers([int startPage = 1]);
}
