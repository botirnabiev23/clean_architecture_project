part of 'number_trivia_bloc.dart';

sealed class NumberTriviaEvent extends Equatable {
  const NumberTriviaEvent();
}

class GetTriviaForRandomNumberEvent extends NumberTriviaEvent {
  @override
  List<Object?> get props => [];
}
