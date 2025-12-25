import 'package:clean_architecture_project/core/error/failures.dart';
import 'package:clean_architecture_project/feature/number_trivia/domain/entities/number_trivia.dart';
import 'package:dartz/dartz.dart';

abstract interface class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}
