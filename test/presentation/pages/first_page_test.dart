import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:suit_media_test_app/presentation/blocs/palindrom_bloc/palindrom_bloc.dart';
import 'package:suit_media_test_app/presentation/blocs/username_bloc/username_bloc.dart';
import 'package:suit_media_test_app/presentation/pages/first_page.dart';
import 'package:suit_media_test_app/presentation/widgets/text_field_widget.dart';

class MockPalindromBloc extends MockBloc<PalindromEvent, PalindromState>
    implements PalindromBloc {}

class MockUserNameBloc extends MockBloc<UserNameEvent, UserNameState>
    implements UserNameBloc {}

void main() {
  late MockPalindromBloc mockPalindromBloc;
  late MockUserNameBloc mockUserNameBloc;

  setUp(() {
    mockPalindromBloc = MockPalindromBloc();
    mockUserNameBloc = MockUserNameBloc();
  });

  Widget makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PalindromBloc>(create: (_) => mockPalindromBloc),
        BlocProvider<UserNameBloc>(create: (_) => mockUserNameBloc)
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should has exactly 2 text field and 2 button',
      (WidgetTester tester) async {
    //arrange
    when(() => mockPalindromBloc.state).thenReturn(const PalindromState());

    final textFieldWidgetFinder = find.byType(TextFieldWidget);
    final buttonFinder = find.byType(ElevatedButton);

    //act
    await tester.pumpWidget(makeTestableWidget(const FirstPage()));

    expect(buttonFinder, findsExactly(2));
    expect(textFieldWidgetFinder, findsExactly(2));
  });
}
