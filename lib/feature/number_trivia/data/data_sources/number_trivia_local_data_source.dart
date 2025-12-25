import 'dart:convert';
import 'dart:math';
import 'package:clean_architecture_project/core/error/exceptions.dart';
import 'package:clean_architecture_project/feature/number_trivia/data/models/number_trivia_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class NumberTriviaLocalDataSource {
  /// Gets a random cached [NumberTriviaModel] from the list of cached facts.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<NumberTriviaModel> getRandomCachedTrivia();

  /// Caches a new fact by adding it to the list (max 50 facts).
  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache);
}

const cachedNumberTriviaList = 'CACHED_NUMBER_TRIVIA_LIST';
const maxCachedFacts = 50;

class NumberTriviaLocalDataSourceImpl implements NumberTriviaLocalDataSource {
  final SharedPreferences sharedPreferences;

  NumberTriviaLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<NumberTriviaModel> getRandomCachedTrivia() {
    final jsonString = sharedPreferences.getString(cachedNumberTriviaList);
    if (jsonString != null) {
      final List<dynamic> jsonList = json.decode(jsonString);
      if (jsonList.isNotEmpty) {
        final randomIndex = Random().nextInt(jsonList.length);
        return Future.value(NumberTriviaModel.fromJson(jsonList[randomIndex]));
      } else {
        throw CacheException();
      }
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache) async {
    final jsonString = sharedPreferences.getString(cachedNumberTriviaList);
    List<Map<String, dynamic>> factsList = [];

    if (jsonString != null) {
      final List<dynamic> jsonList = json.decode(jsonString);
      factsList = jsonList.map((e) => e as Map<String, dynamic>).toList();
    }

    final existingIndex = factsList.indexWhere(
      (fact) => fact['id'] == triviaToCache.id,
    );

    if (existingIndex == -1) {
      factsList.insert(0, triviaToCache.toJson());

      if (factsList.length > maxCachedFacts) {
        factsList = factsList.sublist(0, maxCachedFacts);
      }

      await sharedPreferences.setString(
        cachedNumberTriviaList,
        json.encode(factsList),
      );
    }
  }
}
