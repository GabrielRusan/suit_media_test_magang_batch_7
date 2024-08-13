import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:suit_media_test_app/domain/entities/user.dart';
import 'package:suit_media_test_app/presentation/blocs/selected_user_bloc/selected_user_bloc.dart';

import '../../../dummy_data/dummy_object.dart';

void main() {
  late SelectedUserBloc selectedUserBloc;
  setUp(() {
    selectedUserBloc = SelectedUserBloc();
  });

  test('inital state should SelectedUserState', () {
    expect(
        selectedUserBloc.state,
        const SelectedUserState(User(
            id: 1,
            email: 'email',
            firstName: 'Selected',
            lastName: 'User Name',
            avatar: 'avatar')));
  });

  blocTest<SelectedUserBloc, SelectedUserState>(
    'should emit SelectedUserState with valid user when even occured',
    build: () => selectedUserBloc,
    act: (bloc) => bloc.add(SelectedUserEvent(user: tUser)),
    expect: () => [SelectedUserState(tUser)],
  );
}
