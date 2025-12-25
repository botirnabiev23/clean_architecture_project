import 'dart:convert';

import 'package:clean_architecture_project/core/error/exceptions.dart';
import 'package:clean_architecture_project/feature/number_trivia/data/models/number_trivia_model.dart';
import 'package:dio/dio.dart';

abstract interface class NumberTriviaRemoteDataSource {
  /// Calls the https://uselessfacts.jsph.pl/random.json endpoint
  ///
  /// Throws a [ServerException] for all error codes
  Future<NumberTriviaModel> getRandomNumberTrivia();
}

class NumberTriviaRemoteDataSourceImpl implements NumberTriviaRemoteDataSource {
  final Dio dio;

  NumberTriviaRemoteDataSourceImpl({required this.dio});

  @override
  Future<NumberTriviaModel> getRandomNumberTrivia() async {
    final response = await dio.get(
      'https://uselessfacts.jsph.pl/random.json',
      options: Options(headers: {'Content-Type': 'application/json'}),
    );

    if (response.statusCode == 200) {
      final data = response.data is String
          ? json.decode(response.data)
          : response.data;
      return NumberTriviaModel.fromJson(data);
    } else {
      throw ServerException();
    }
  }
}
