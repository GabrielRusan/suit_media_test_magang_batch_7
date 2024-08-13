import 'package:dartz/dartz.dart';
import 'package:suit_media_test_app/data/datasources/remote_datasource.dart';
import 'package:suit_media_test_app/domain/entities/user.dart';
import 'package:suit_media_test_app/domain/repository/user_repository.dart';
import 'package:suit_media_test_app/utils/exception.dart';
import 'package:suit_media_test_app/utils/failure.dart';

class UserRepositoryImpl implements UserRepository {
  final RemoteDatasource remoteDatasource;

  UserRepositoryImpl({required this.remoteDatasource});

  @override
  Future<Either<Failure, List<User>>> getUsers([int startPage = 1]) async {
    try {
      final result = await remoteDatasource.getUsers(startPage);
      return Right(result.map((userModel) => userModel.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    }
  }
}
