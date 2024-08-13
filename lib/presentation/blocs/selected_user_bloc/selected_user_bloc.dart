import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:suit_media_test_app/domain/entities/user.dart';

part 'selected_user_event.dart';
part 'selected_user_state.dart';

class SelectedUserBloc extends Bloc<SelectedUserEvent, SelectedUserState> {
  SelectedUserBloc()
      : super(const SelectedUserState(User(
            id: 1,
            email: 'email',
            firstName: 'Selected',
            lastName: 'User Name',
            avatar: 'avatar'))) {
    on<SelectedUserEvent>((event, emit) {
      emit(SelectedUserState(event.user));
    });
  }
}
