part of 'username_bloc.dart';

sealed class UserNameEvent extends Equatable {
  const UserNameEvent();

  @override
  List<Object> get props => [];
}

class OnChangedUserName extends UserNameEvent {
  final String value;

  const OnChangedUserName({required this.value});

  @override
  List<Object> get props => [value];
}
