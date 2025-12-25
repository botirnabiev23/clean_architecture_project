import 'package:equatable/equatable.dart';

class NumberTrivia extends Equatable {
  final String id;
  final String text;
  final String? source;

  const NumberTrivia({required this.id, required this.text, this.source});

  @override
  List<Object?> get props => [id, text, source];
}
