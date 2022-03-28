import 'package:binary_quiz_game/screen/quiz/decimal_quiz/widget/page/decimal_quiz_screen.dart';
import 'package:binary_quiz_game/screen/quiz/decimal_quiz_result/widget/page/decimal_quiz_result_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "decimalQuiz/game",
      routes: {
        "decimalQuiz/game": (context) => const DecimalQuizScreen(title: 'Decimal Quiz'),
        "decimalQuiz/result": (context) => const DecimalQuizResultScreen(title: 'Decimal Quiz Result'),

        // TODO: 結果画面を作る
        // TODO: 2進数での回答モードを作る
        // TODO: モードの選択画面を作る
        // TODO: オプション画面を作る
      },
    );
  }
}
