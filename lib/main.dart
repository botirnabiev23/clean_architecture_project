import 'package:clean_architecture_project/core/di/injection_container.dart';
import 'package:clean_architecture_project/feature/number_trivia/presentation/pages/number_trivia_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.green.shade800),
      home: NumberTriviaPage(),
    );
  }
}
