part of 'palindrom_bloc.dart';

sealed class PalindromEvent extends Equatable {
  const PalindromEvent();

  @override
  List<Object> get props => [];
}

class OnChangedPalindrom extends PalindromEvent {
  final String value;

  const OnChangedPalindrom({required this.value});

  @override
  List<Object> get props => [value];
}

class CheckPalindrom extends PalindromEvent {}
