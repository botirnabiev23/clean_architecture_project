import 'package:clean_architecture_project/feature/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TriviaControls extends StatefulWidget {
  const TriviaControls({super.key});

  @override
  State<TriviaControls> createState() => _TriviaControlsState();
}

class _TriviaControlsState extends State<TriviaControls> {
  String? inputStr;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Input Number',
          ),
          onChanged: (value) => inputStr = value,
          onSubmitted: (_) => dispatchConcrete(),
        ),
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                onPressed: () => dispatchConcrete(),
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.green),
                ),
                child: const Text(
                  'Search',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  context.read<NumberTriviaBloc>().add(
                    GetTriviaForRandomNumberEvent(),
                  );
                },
                child: Text('Random', style: TextStyle(color: Colors.black)),
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
      ],
    );
  }

  void dispatchConcrete() {
    if (inputStr != null) {
      context.read<NumberTriviaBloc>().add(
        GetTriviaForConcreteNumberEvent(inputStr ?? ''),
      );
    }
    controller.clear();
  }
}
