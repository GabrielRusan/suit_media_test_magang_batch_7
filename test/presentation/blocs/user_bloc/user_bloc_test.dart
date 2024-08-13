import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:suit_media_test_app/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:suit_media_test_app/utils/failure.dart';

import '../../../dummy_data/dummy_object.dart';
import '../../../test_helper/usecases_test_helper.mocks.dart';

void main() {
  late MockGetUsers mockGetUsers;
  late UserBloc userBloc;

  setUp(() {
    mockGetUsers = MockGetUsers();
    userBloc = UserBloc(mockGetUsers);
  });

  test('Initial state should UserState', () {
    expect(userBloc.state, const UserState());
    expect(userBloc.state.status, UserStatus.initial);
  });

  group('Fetch Users Test', () {
    blocTest<UserBloc, UserState>(
      'emits nothing when users has reached maximum amount',
      build: () {
        return userBloc;
      },
      seed: () => const UserState(hasReachedMax: true),
      act: (bloc) => bloc.add(FetchUsers()),
      expect: () => [],
    );

    blocTest<UserBloc, UserState>(
      'drop new events when processing current event',
      build: () {
        when(mockGetUsers.execute()).thenAnswer((_) async => Right(tUserList));
        return userBloc;
      },
      wait: const Duration(seconds: 3),
      act: (bloc) => bloc
        ..add(FetchUsers())
        ..add(FetchUsers()),
      expect: () => [
        UserState(
          status: UserStatus.success,
          users: tUserList,
          hasReachedMax: true,
        )
      ],
    );

    blocTest<UserBloc, UserState>(
      'throttle events',
      build: () {
        when(mockGetUsers.execute()).thenAnswer((_) async => Right(tUserList));
        return userBloc;
      },
      act: (bloc) async {
        bloc.add(FetchUsers());
        await Future<void>.delayed(Duration.zero);
        bloc.add(FetchUsers());
      },
      wait: const Duration(seconds: 3),
      expect: () => [
        UserState(
          status: UserStatus.success,
          users: tUserList,
          hasReachedMax: true,
        )
      ],
    );

    group('when status is initial', () {
      blocTest<UserBloc, UserState>(
        'emits status failure when failed fetch data users',
        build: () {
          when(mockGetUsers.execute())
              .thenAnswer((_) async => const Left(ServerFailure('')));
          return userBloc;
        },
        act: (bloc) => bloc.add(FetchUsers()),
        wait: const Duration(seconds: 3),
        expect: () => [
          const UserState(
            status: UserStatus.failure,
          )
        ],
      );
      blocTest<UserBloc, UserState>(
        'emits successful status when usecase fetches initial users',
        build: () {
          when(mockGetUsers.execute())
              .thenAnswer((_) async => Right(t10UserList));
          return userBloc;
        },
        act: (bloc) => bloc.add(FetchUsers()),
        wait: const Duration(seconds: 3),
        expect: () => [
          UserState(
            status: UserStatus.success,
            users: t10UserList,
          )
        ],
      );

      blocTest<UserBloc, UserState>(
        'emits successful status and hasReachedMax true when data fetched length are not multiple of 10',
        build: () {
          when(mockGetUsers.execute())
              .thenAnswer((_) async => Right(tUserList));
          return userBloc;
        },
        act: (bloc) => bloc.add(FetchUsers()),
        wait: const Duration(seconds: 3),
        expect: () => [
          UserState(
              status: UserStatus.success, users: tUserList, hasReachedMax: true)
        ],
      );
    });

    group('when status is not initial', () {
      blocTest<UserBloc, UserState>(
        'emits status failure when failed fetch data users',
        build: () {
          when(mockGetUsers.execute())
              .thenAnswer((_) async => const Left(ServerFailure('')));
          return userBloc;
        },
        seed: () => const UserState(status: UserStatus.success),
        act: (bloc) => bloc.add(FetchUsers()),
        expect: () => [
          const UserState(
            status: UserStatus.failure,
          )
        ],
      );

      blocTest<UserBloc, UserState>(
        'emits hasReachedMax true when data fetched are empty',
        build: () {
          when(mockGetUsers.execute()).thenAnswer((_) async => const Right([]));
          return userBloc;
        },
        seed: () => const UserState(status: UserStatus.failure),
        act: (bloc) => bloc.add(FetchUsers()),
        expect: () => [
          const UserState(
            status: UserStatus.success,
            hasReachedMax: true,
          )
        ],
      );

      blocTest<UserBloc, UserState>(
        'emits hasReachedMax false when data fetched length are multiple of 10',
        build: () {
          when(mockGetUsers.execute(2))
              .thenAnswer((_) async => Right(t10UserList));
          return userBloc;
        },
        seed: () => UserState(status: UserStatus.success, users: t10UserList),
        act: (bloc) => bloc.add(FetchUsers()),
        expect: () => [
          UserState(
              status: UserStatus.success,
              hasReachedMax: false,
              users: List.of(t10UserList)..addAll(t10UserList))
        ],
      );

      blocTest<UserBloc, UserState>(
        'emits hasReachedMax true when data fetched length are not multiple of 10',
        build: () {
          when(mockGetUsers.execute())
              .thenAnswer((_) async => Right(tExtraUserList));
          return userBloc;
        },
        seed: () => UserState(status: UserStatus.success, users: tUserList),
        act: (bloc) => bloc.add(FetchUsers()),
        expect: () => [
          UserState(
              status: UserStatus.success,
              hasReachedMax: true,
              users: tCombinedUserList)
        ],
      );
    });
  });
}
