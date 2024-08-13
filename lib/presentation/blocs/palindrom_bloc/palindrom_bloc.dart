import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'palindrom_event.dart';
part 'palindrom_state.dart';

class PalindromBloc extends Bloc<PalindromEvent, PalindromState> {
  PalindromBloc() : super(const PalindromState()) {
    on<OnChangedPalindrom>(_onChanedPalindromValue);
    on<CheckPalindrom>(_onCheckPalindrom);
  }

  void _onCheckPalindrom(CheckPalindrom event, Emitter<PalindromState> emit) {
    // kembalikan ke initial terlebih dahulu
    emit(state.copyWith(palindromStatus: PalindromStatus.initial));

    if (state.value == '') {
      emit(state.copyWith(palindromStatus: PalindromStatus.no));
      return;
    }

    // Menghilangkan spasi dan mengubah ke huruf kecil
    String normalizedInput = state.value.replaceAll(' ', '').toLowerCase();

    // Membalik string
    String reversedInput = normalizedInput.split('').reversed.join('');

    // Membandingkan string asli dengan string yang dibalik
    if (normalizedInput == reversedInput) {
      emit(state.copyWith(palindromStatus: PalindromStatus.yes));
    } else {
      emit(state.copyWith(palindromStatus: PalindromStatus.no));
    }
  }

  void _onChanedPalindromValue(
      OnChangedPalindrom event, Emitter<PalindromState> emit) {
    emit(state.copyWith(
        palindromStatus: PalindromStatus.initial, value: event.value));
  }
}
