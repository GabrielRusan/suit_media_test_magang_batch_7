import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:suit_media_test_app/data/datasources/remote_datasource.dart';
import 'package:suit_media_test_app/domain/repository/user_repository.dart';

@GenerateMocks([Dio, RemoteDatasource, UserRepository])
void main() {}
