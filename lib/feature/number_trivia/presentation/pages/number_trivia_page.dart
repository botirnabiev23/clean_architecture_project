import 'package:clean_architecture_project/feature/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:clean_architecture_project/core/di/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_architecture_project/feature/number_trivia/presentation/widgets/widgets.dart';

class NumberTriviaPage extends StatelessWidget {
  const NumberTriviaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Random Facts')),
      body: BlocProvider(
        create: (_) => sl<NumberTriviaBloc>(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return LoadingWidget();
                  }

                  if (state.trivia != null) {
                    return TriviaDisplay(numberTrivia: state.trivia!);
                  }

                  final error = state.errorMessage;
                  if (error != null && error.isNotEmpty) {
                    return MessageDisplay(message: error);
                  }

                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    height: MediaQuery.of(context).size.height / 3,
                    child: const MessageDisplay(message: 'Start random fact'),
                  );
                },
              ),
              const TriviaControls(),
            ],
          ),
        ),
      ),
    );
  }
}
