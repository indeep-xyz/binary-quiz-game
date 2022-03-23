import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'component/body/answer_selection_field.dart';
import 'layout/header_layout.dart';
import 'provider/quiz_notifier.dart';

class DecimalQuizScreen extends StatefulWidget {
  const DecimalQuizScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DecimalQuizScreen> createState() => _State();
}

// TODO: 時間制限をつける
// TODO: スコアを保存する

class _State extends State<DecimalQuizScreen> {
  // TODO: クイズのエコシステムを作る

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ChangeNotifierProvider(
        create: (_) => QuizNotifier(),
        child: Column(
          children: const [
            // 問題、点数等
            HeaderLayout(),

            // 回答欄
            AnswerSelectionField(),
          ],
        ),
      ),
    );
  }
}
