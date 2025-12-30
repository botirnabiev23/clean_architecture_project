import 'package:clean_architecture_project/feature/number_trivia/domain/entities/number_trivia.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'number_trivia_model.g.dart';

@JsonSerializable()
class NumberTriviaModel extends NumberTrivia {
  const NumberTriviaModel({
    required super.id,
    required super.text,
    super.source,
  });

  factory NumberTriviaModel.fromJson(Map<String, dynamic> json) =>
      _$NumberTriviaModelFromJson(json);

  Map<String, dynamic> toJson() => _$NumberTriviaModelToJson(this);

  factory NumberTriviaModel.fromEntity(NumberTrivia numberTrivia) {
    return NumberTriviaModel(id: numberTrivia.id, text: numberTrivia.text);
  }
}
