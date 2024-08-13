part of 'username_bloc.dart';

final class UserNameState extends Equatable {
  final String username;

  const UserNameState({required this.username});
  @override
  List<Object> get props => [username];
}
