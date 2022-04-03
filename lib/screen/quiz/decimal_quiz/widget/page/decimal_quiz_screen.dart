import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../organism/answer_selection/answer_selection_field.dart';
import '../organism/header/header_layout.dart';
import '../../model/view_model/quiz_view_model.dart';

/// 10進数で回答するゲーム時のプレイ画面
class DecimalQuizScreen extends StatefulWidget {
  const DecimalQuizScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DecimalQuizScreen> createState() => _State();
}

// TODO: ゲームモードの選択画面に戻るための処理を追加する (2度戻るボタンタップで、右上に×ボタン追加、等)
// TODO: バックグラウンドから戻ってきた場合、秒数経過 or 問題変更する
// TODO: Scaffold.child下をlayout内に突っ込む
// TODO: 回答手段をテンキー風にする

class _State extends State<DecimalQuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ChangeNotifierProvider(
        create: (BuildContext context) => QuizViewModel(context),
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
