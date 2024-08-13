part of 'selected_user_bloc.dart';

final class SelectedUserState extends Equatable {
  final User user;
  const SelectedUserState(this.user);

  @override
  List<Object> get props => [user];
}
