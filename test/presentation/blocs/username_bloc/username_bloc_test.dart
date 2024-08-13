import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:suit_media_test_app/presentation/blocs/username_bloc/username_bloc.dart';

void main() {
  late UserNameBloc userNameBloc = UserNameBloc();

  setUp(() {
    userNameBloc = UserNameBloc();
  });

  test('Initial state should UserNameState', () {
    expect(
        userNameBloc.state, const UserNameState(username: 'Initial User Name'));
  });

  group('change username test', () {
    blocTest<UserNameBloc, UserNameState>(
      'Should emit UsernameState with correct value',
      build: () {
        return userNameBloc;
      },
      act: (bloc) => bloc.add(const OnChangedUserName(value: 'suitmedia')),
      expect: () => [const UserNameState(username: 'suitmedia')],
    );
  });
}
