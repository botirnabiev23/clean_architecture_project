import 'dart:async';
import 'package:clean_architecture_project/core/error/failures.dart';
import 'package:clean_architecture_project/core/use_cases/use_case.dart';
import 'package:clean_architecture_project/feature/number_trivia/domain/use_cases/get_random_number_trivia.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_architecture_project/feature/number_trivia/domain/entities/number_trivia.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'number_trivia_event.dart';

part 'number_trivia_state.dart';

part 'number_trivia_bloc.freezed.dart';


const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

@injectable
class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  final GetRandomNumberTrivia getRandomNumberTrivia;

  NumberTriviaBloc({required this.getRandomNumberTrivia})
    : super(const NumberTriviaState()) {
    on<_Load>(_onRandom);
  }

  Future<void> _onRandom(
      _Load event,
    Emitter<NumberTriviaState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final failureOrTrivia = await getRandomNumberTrivia(NoParams());
    emit(
      failureOrTrivia.fold(
            (failure) => state.copyWith(
          isLoading: false,
          errorMessage: _mapFailureToMessage(failure),
        ),
            (trivia) => state.copyWith(
          isLoading: false,
          trivia: trivia,
        ),
      ),
    );
  }

  // NumberTriviaState _eitherToState(failureOrTrivia) {
  //   return failureOrTrivia.fold(
  //     (failure) => Error(message: _mapFailureToMessage(failure)),
  //     (trivia) => Loaded(trivia: trivia),
  //   );
  // }

  String _mapFailureToMessage(Failure failure) {
    return switch (failure.runtimeType) {
      ServerFailure _ => SERVER_FAILURE_MESSAGE,
      CacheFailure _ => CACHE_FAILURE_MESSAGE,
      _ => 'Unexpected error',
    };
  }
}
