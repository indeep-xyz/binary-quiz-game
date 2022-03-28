import 'package:binary_quiz_game/screen/quiz/decimal_quiz_result/widget/molecule/button/retry_button.dart';
import 'package:flutter/material.dart';

/// 10進数で回答するゲーム[DecimalQuizScreen]時の結果画面
class DecimalQuizResultScreen extends StatefulWidget {
  const DecimalQuizResultScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DecimalQuizResultScreen> createState() => _State();
}

// TODO: スコアを受け取って表示する

class _State extends State<DecimalQuizResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: const [
          // 問題、点数等
          RetryButton(),
        ],
      ),
    );
  }
}
