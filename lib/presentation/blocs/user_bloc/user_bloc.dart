import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:suit_media_test_app/domain/entities/user.dart';
import 'package:suit_media_test_app/domain/usecases/get_users.dart';
import 'package:suit_media_test_app/utils/transformers.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUsers getUsers;
  UserBloc(this.getUsers) : super(const UserState()) {
    on<FetchUsers>(_onFetchUsers,
        transformer: throttleDroppable(const Duration(milliseconds: 100)));
  }

  Future<void> _onFetchUsers(FetchUsers event, Emitter<UserState> emit) async {
    if (state.hasReachedMax) return;

    if (state.status == UserStatus.initial) {
      await Future.delayed(const Duration(seconds: 3));
      final result = await getUsers.execute();

      result.fold((failure) {
        emit(state.copyWith(status: UserStatus.failure));
      }, (data) {
        emit(data.length != 10
            ? state.copyWith(
                status: UserStatus.success,
                users: data,
                hasReachedMax: true,
              )
            : state.copyWith(
                status: UserStatus.success,
                users: data,
              ));
      });
    } else {
      final result = await getUsers.execute((state.users.length ~/ 10) + 1);

      result.fold((failure) {
        emit(state.copyWith(status: UserStatus.failure));
      }, (data) {
        emit(
          data.isEmpty
              ? state.copyWith(
                  hasReachedMax: true,
                  status: UserStatus.success,
                )
              : data.length != 10
                  ? state.copyWith(
                      status: UserStatus.success,
                      users: List.of(state.users)..addAll(data),
                      hasReachedMax: true,
                    )
                  : state.copyWith(
                      status: UserStatus.success,
                      users: List.of(state.users)..addAll(data),
                      hasReachedMax: false,
                    ),
        );
      });
    }
  }
}
