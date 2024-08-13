import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:suit_media_test_app/presentation/blocs/palindrom_bloc/palindrom_bloc.dart';

void main() {
  late PalindromBloc palindromBloc = PalindromBloc();

  setUp(() {
    palindromBloc = PalindromBloc();
  });

  group('On changed palindrom value test', () {
    blocTest<PalindromBloc, PalindromState>(
      'Should emit [PalindromState] with right value',
      build: () {
        return palindromBloc;
      },
      act: (bloc) => bloc.add(const OnChangedPalindrom(value: 'kasur rusak')),
      expect: () => [const PalindromState(value: 'kasur rusak')],
    );
  });

  group('On check palindrom test', () {
    blocTest<PalindromBloc, PalindromState>(
      'Should emit [initial, yes] when value is palindrom',
      build: () {
        return palindromBloc;
      },
      act: (bloc) => bloc.add(CheckPalindrom()),
      seed: () => const PalindromState(
        value: 'kasur rusak',
        palindromStatus: PalindromStatus.initial,
      ),
      expect: () => [
        const PalindromState(
          value: 'kasur rusak',
          palindromStatus: PalindromStatus.yes,
        )
      ],
    );

    blocTest<PalindromBloc, PalindromState>(
      'Should emit [initial, no] when value is not palindrom',
      build: () {
        return palindromBloc;
      },
      act: (bloc) => bloc.add(CheckPalindrom()),
      seed: () => const PalindromState(
        value: 'suit media',
        palindromStatus: PalindromStatus.initial,
      ),
      expect: () => [
        const PalindromState(
          value: 'suit media',
          palindromStatus: PalindromStatus.no,
        )
      ],
    );
  });
}
