part of 'selected_user_bloc.dart';

final class SelectedUserEvent extends Equatable {
  final User user;
  const SelectedUserEvent({required this.user});

  @override
  List<Object> get props => [user];
}
