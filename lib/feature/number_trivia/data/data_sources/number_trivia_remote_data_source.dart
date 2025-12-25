import 'dart:convert';

import 'package:clean_architecture_project/core/error/exceptions.dart';
import 'package:clean_architecture_project/feature/number_trivia/data/models/number_trivia_model.dart';
import 'package:dio/dio.dart';

abstract interface class NumberTriviaRemoteDataSource {
  /// Calls the http://numberapi.com/{number} endpoint
  ///
  /// Throws a [ServerException] for all error codes
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number);

  /// Calls the http://numberapi.com/random endpoint
  ///
  /// Throws a [ServerException] for all error codes
  Future<NumberTriviaModel> getRandomNumberTrivia();
}

class NumberTriviaRemoteDataSourceImpl implements NumberTriviaRemoteDataSource {
  final Dio dio;

  NumberTriviaRemoteDataSourceImpl({required this.dio});

  @override
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number) =>
      _getTriviaFromUrl('http://numbersapi.com/$number');

  @override
  Future<NumberTriviaModel> getRandomNumberTrivia() =>
      _getTriviaFromUrl('http://numbersapi.com/random');

  Future<NumberTriviaModel> _getTriviaFromUrl(String url) async {
    print('dfsdf');
    final response = await dio.get(
      url,
      options: Options(headers: {'Content-Type': 'application/json'}),
    );

    print('response');
    print(response);

    if (response.statusCode == 200) {
      return NumberTriviaModel.fromJson(json.decode(response.data));
    } else {
      throw ServerException();
    }
  }
}
