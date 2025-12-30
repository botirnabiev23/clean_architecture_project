import 'package:clean_architecture_project/feature/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TriviaControls extends StatelessWidget {
  const TriviaControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () {
          context.read<NumberTriviaBloc>().add(NumberTriviaEvent.load());
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: Colors.blue,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        ),
        child: const Text(
          'Get Random Fact',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
