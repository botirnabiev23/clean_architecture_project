import 'package:clean_architecture_project/feature/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:clean_architecture_project/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_architecture_project/feature/number_trivia/presentation/widgets/widgets.dart';

class NumberTriviaPage extends StatelessWidget {
  const NumberTriviaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Number Trivia')),
      body: BlocProvider(
        create: (_) => sl<NumberTriviaBloc>(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
                builder: (context, state) {
                  if (state is Empty) {
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      height: MediaQuery.of(context).size.height / 3,
                      child: MessageDisplay(message: 'Start searching'),
                    );
                  } else if (state is Loading) {
                    return LoadingWidget();
                  } else if (state is Loaded) {
                    return TriviaDisplay(numberTrivia: state.trivia);
                  } else if (state is Error) {
                    return MessageDisplay(message: state.message);
                  }
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    height: MediaQuery.of(context).size.height / 3,
                    child: MessageDisplay(message: 'something'),
                  );
                },
              ),
              TriviaControls(),
            ],
          ),
        ),
      ),
    );
  }
}
