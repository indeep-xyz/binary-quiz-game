import 'package:binary_quiz_game/screen/quiz/decimal_quiz/widget/page/decimal_quiz_screen.dart';
import 'package:binary_quiz_game/screen/quiz/decimal_quiz_result/widget/page/decimal_quiz_result_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// TODO: ゲームモードの追加 (2進数による回答…FlipCardによる値の実装、回答ボタンの実装)
// TODO: ゲームモードの追加 (2進数による回答…パターン２。制限回数内の操作で正解を得ないとゲームオーバー)
// TODO: ゲームモード選択画面の追加
// TODO: ゲームモード選択画面の選択時、何かしらの演出をして画面遷移する
// TODO: 音を出す (音楽)
// TODO: 音を出す (効果音)

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
