import 'package:binary_quiz_game/screen/game/decimal_quiz/decimal_quiz_screen.dart';
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
      routes: {
        "/": (context) => const DecimalQuizScreen(title: 'Decimal Quiz'),

        // TODO: 結果画面を作る
        // TODO: 2進数での回答モードを作る
        // TODO: モードの選択画面を作る
        // TODO: オプション画面を作る
      },
    );
  }
}
