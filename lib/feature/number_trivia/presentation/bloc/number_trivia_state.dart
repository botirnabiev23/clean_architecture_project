part of 'number_trivia_bloc.dart';

sealed class NumberTriviaState extends Equatable {
  const NumberTriviaState();
}

final class NumberTriviaInitial extends NumberTriviaState {
  @override
  List<Object> get props => [];
}

class Empty extends NumberTriviaState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class Loading extends NumberTriviaState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class Loaded extends NumberTriviaState {
  final NumberTrivia trivia;

  const Loaded({required this.trivia});

  @override
  List<Object?> get props => [trivia];
}

class Error extends NumberTriviaState {
  final String message;

  const Error({required this.message});

  @override
  List<Object?> get props => [message];
}
