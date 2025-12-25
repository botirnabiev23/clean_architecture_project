import 'package:clean_architecture_project/feature/number_trivia/domain/entities/number_trivia.dart';

class NumberTriviaModel extends NumberTrivia {
  const NumberTriviaModel({
    required super.id,
    required super.text,
    super.source,
  });

  factory NumberTriviaModel.fromJson(Map<String, dynamic> json) {
    return NumberTriviaModel(
      id: json['id'],
      text: json['text'],
      source: json['source'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'text': text, 'source': source};
  }
}
