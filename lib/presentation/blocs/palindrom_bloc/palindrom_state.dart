part of 'palindrom_bloc.dart';

enum PalindromStatus { yes, no, initial }

final class PalindromState extends Equatable {
  const PalindromState({
    this.palindromStatus = PalindromStatus.initial,
    this.value = '',
  });

  final PalindromStatus palindromStatus;
  final String value;

  PalindromState copyWith({
    String? value,
    PalindromStatus? palindromStatus,
  }) =>
      PalindromState(
        value: value ?? this.value,
        palindromStatus: palindromStatus ?? this.palindromStatus,
      );

  @override
  List<Object> get props => [palindromStatus, value];
}
