import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:suit_media_test_app/utils/transformers.dart';

part 'username_event.dart';
part 'username_state.dart';

class UserNameBloc extends Bloc<UserNameEvent, UserNameState> {
  UserNameBloc() : super(const UserNameState(username: 'Initial User Name')) {
    on<OnChangedUserName>(_onChangedUserName,
        transformer: debounce(const Duration(milliseconds: 500)));
  }

  void _onChangedUserName(
      OnChangedUserName event, Emitter<UserNameState> emit) {
    emit(UserNameState(username: event.value));
  }
}
