import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:suit_media_test_app/presentation/blocs/selected_user_bloc/selected_user_bloc.dart';
import 'package:suit_media_test_app/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:suit_media_test_app/presentation/pages/third_page.dart';

import '../../dummy_data/dummy_object.dart';

class MockSelectedUserBloc
    extends MockBloc<SelectedUserEvent, SelectedUserState>
    implements SelectedUserBloc {}

class MockUserBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

void main() {
  late MockSelectedUserBloc mockSelectedUserBloc;
  late MockUserBloc mockUserBloc;

  setUp(() {
    mockSelectedUserBloc = MockSelectedUserBloc();
    mockUserBloc = MockUserBloc();
  });

  Widget makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SelectedUserBloc>(create: (_) => mockSelectedUserBloc),
        BlocProvider<UserBloc>(create: (_) => mockUserBloc)
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display correct text when status is failure',
      (WidgetTester tester) async {
    //arrange
    when(() => mockUserBloc.state)
        .thenReturn(const UserState(status: UserStatus.failure));

    final textFinder = find.text('failed to fetch users');

    //act
    await tester.pumpWidget(makeTestableWidget(const ThirdPage()));

    expect(textFinder, findsOneWidget);
  });

  testWidgets(
      'Page should display correct text when status is succes but data empty',
      (WidgetTester tester) async {
    //arrange
    when(() => mockUserBloc.state)
        .thenReturn(const UserState(status: UserStatus.success, users: []));

    final textFinder = find.text('no users');

    //act
    await tester.pumpWidget(makeTestableWidget(const ThirdPage()));

    expect(textFinder, findsOneWidget);
  });

  testWidgets(
      'Page should display skeletonizer listView when status is initial',
      (WidgetTester tester) async {
    //arrange
    when(() => mockUserBloc.state).thenReturn(const UserState());

    final listViewFinder = find.byType(ListView);
    final skeletonizerFinder = find.byWidgetPredicate(
      (widget) => widget is Skeletonizer,
    );

    //act
    await tester.pumpWidget(makeTestableWidget(const ThirdPage()));

    expect(skeletonizerFinder, findsOneWidget);
    expect(listViewFinder, findsOneWidget);
  });

  testWidgets(
      'Page should display listview and usercard when status is success',
      (WidgetTester tester) async {
    //arrange
    when(() => mockUserBloc.state).thenReturn(UserState(users: t10UserList));
    when(() => mockSelectedUserBloc.state).thenReturn(SelectedUserState(tUser));

    final listViewFinder = find.byType(ListView);
    final listTileFinder = find.byType(ListTile);

    //act
    await tester.pumpWidget(makeTestableWidget(const ThirdPage()));

    expect(listViewFinder, findsOne);
    expect(listTileFinder, findsAtLeastNWidgets(7));
  });
}
