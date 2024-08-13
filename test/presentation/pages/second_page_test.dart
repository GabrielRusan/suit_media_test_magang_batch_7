import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:suit_media_test_app/presentation/blocs/selected_user_bloc/selected_user_bloc.dart';
import 'package:suit_media_test_app/presentation/blocs/username_bloc/username_bloc.dart';
import 'package:suit_media_test_app/presentation/pages/second_page.dart';

import '../../dummy_data/dummy_object.dart';

class MockSelectedUserBloc
    extends MockBloc<SelectedUserEvent, SelectedUserState>
    implements SelectedUserBloc {}

class MockUserNameBloc extends MockBloc<UserNameEvent, UserNameState>
    implements UserNameBloc {}

void main() {
  late MockSelectedUserBloc mockSelectedUserBloc;
  late MockUserNameBloc mockUserNameBloc;

  setUp(() {
    mockSelectedUserBloc = MockSelectedUserBloc();
    mockUserNameBloc = MockUserNameBloc();
  });

  Widget makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SelectedUserBloc>(create: (_) => mockSelectedUserBloc),
        BlocProvider<UserNameBloc>(create: (_) => mockUserNameBloc)
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display correct username from first page',
      (WidgetTester tester) async {
    //arrange
    when(() => mockUserNameBloc.state)
        .thenReturn(const UserNameState(username: 'Gabriel Rusan'));
    when(() => mockSelectedUserBloc.state).thenReturn(SelectedUserState(tUser));

    final textFinder = find.text('Gabriel Rusan');

    //act
    await tester.pumpWidget(makeTestableWidget(const SecondPage()));

    expect(textFinder, findsOne);
  });

  testWidgets('Page should display correct username from third page',
      (WidgetTester tester) async {
    //arrange
    when(() => mockUserNameBloc.state)
        .thenReturn(const UserNameState(username: ''));
    when(() => mockSelectedUserBloc.state).thenReturn(SelectedUserState(tUser));

    final textFinder = find.text('firstName lastName');

    //act
    await tester.pumpWidget(makeTestableWidget(const SecondPage()));

    expect(textFinder, findsOne);
  });
}
