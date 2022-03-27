import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'component/body/answer_selection_field.dart';
import 'layout/header_layout.dart';
import 'provider/quiz_notifier.dart';

/// 10進数で回答するゲーム時のプレイ画面
class DecimalQuizScreen extends StatefulWidget {
  const DecimalQuizScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DecimalQuizScreen> createState() => _State();
}

// TODO: スコアを保存する
// TODO: 正解時、影響のある値を点滅アニメーションさせる
// TODO: 不正解時、影響のある値を点滅アニメーションさせる

class _State extends State<DecimalQuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ChangeNotifierProvider(
        create: (BuildContext context) => QuizNotifier(context),
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
