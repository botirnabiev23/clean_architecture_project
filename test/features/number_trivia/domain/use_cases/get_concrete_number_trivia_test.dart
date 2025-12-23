import 'package:clean_architecture_project/core/error/failures.dart';
import 'package:clean_architecture_project/feature/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architecture_project/feature/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:clean_architecture_project/feature/number_trivia/domain/use_cases/get_concerete_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';


class MockNumberTriviaRepository extends Mock implements NumberTriviaRepository {
  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number) =>
      super.noSuchMethod(
        Invocation.method(#getConcreteNumberTrivia, [number]),
        returnValue: Future.value(
          Right<Failure, NumberTrivia>(
            const NumberTrivia(text: 'stub', number: 0),
          ),
        ),
      ) as Future<Either<Failure, NumberTrivia>>;

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() =>
      super.noSuchMethod(
        Invocation.method(#getRandomNumberTrivia, []),
        returnValue: Future.value(
          Right<Failure, NumberTrivia>(
            const NumberTrivia(text: 'stub', number: 0),
          ),
        ),
      ) as Future<Either<Failure, NumberTrivia>>;
}


void main() {
  late GetConcreteNumberTrivia usecase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;
  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });

  final tNumber = 1;
  final tNumberTrivia = NumberTrivia(text: 'text', number: 1);

  test('should get trivia for the number from the repository', () async {
    when(
      mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber),
    ).thenAnswer((_) async => Right(tNumberTrivia));

    final result = await usecase(number: tNumber);

    expect(result, Right(tNumberTrivia));
    verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
  });
}
