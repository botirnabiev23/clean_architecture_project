import 'dart:async';
import 'package:clean_architecture_project/core/error/failures.dart';
import 'package:clean_architecture_project/core/use_cases/usecase.dart';
import 'package:clean_architecture_project/feature/number_trivia/domain/use_cases/get_concrete_number_trivia.dart';
import 'package:clean_architecture_project/feature/number_trivia/domain/use_cases/get_random_number_trivia.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_architecture_project/core/util/input_converter.dart';
import 'package:clean_architecture_project/feature/number_trivia/domain/entities/number_trivia.dart';
import 'package:equatable/equatable.dart';

part 'number_trivia_event.dart';

part 'number_trivia_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero';

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  final GetConcreteNumberTrivia getTriviaForConcreteNumber;
  final GetRandomNumberTrivia getTriviaForRandomNumber;
  final InputConverter inputConverter;

  NumberTriviaBloc({
    required this.getTriviaForConcreteNumber,
    required this.getTriviaForRandomNumber,
    required this.inputConverter,
  }) : super(NumberTriviaInitial()) {
    on<GetTriviaForConcreteNumberEvent>(_onConcrete);
    on<GetTriviaForRandomNumberEvent>(_onRandom);
  }

  Future<void> _onConcrete(
    GetTriviaForConcreteNumberEvent event,
    Emitter<NumberTriviaState> emit,
  ) async {
    final inputEither = inputConverter.stringToUnsignedInteger(
      event.numberString,
    );

    await inputEither.fold(
      (failure) async {
        emit(const Error(message: INVALID_INPUT_FAILURE_MESSAGE));
      },
      (integer) async {
        emit(Loading());
        final failureOrTrivia = await getTriviaForConcreteNumber(
          Params(number: integer),
        );
        emit(_eitherToState(failureOrTrivia));
      },
    );
  }

  Future<void> _onRandom(
    GetTriviaForRandomNumberEvent event,
    Emitter<NumberTriviaState> emit,
  ) async {
    emit(Loading());
    final failureOrTrivia = await getTriviaForRandomNumber(NoParams());
    emit(_eitherToState(failureOrTrivia));
  }

  NumberTriviaState _eitherToState(failureOrTrivia) {
    return failureOrTrivia.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (trivia) => Loaded(trivia: trivia),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    return switch (failure.runtimeType) {
      ServerFailure _ => SERVER_FAILURE_MESSAGE,
      CacheFailure _ => CACHE_FAILURE_MESSAGE,
      _ => 'Unexpected error',
    };
  }
}
