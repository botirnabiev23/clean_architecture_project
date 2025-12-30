part of 'number_trivia_bloc.dart';

@freezed
abstract class NumberTriviaState with _$NumberTriviaState {
  const factory NumberTriviaState({
    NumberTrivia? trivia,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _NumberTriviaState;
}