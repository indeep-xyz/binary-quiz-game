import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/quiz_notifier.dart';

/// クイズとなる値の表示部品
class QuestionIndicator extends StatelessWidget {

  /// 共通のスタイル設定[TextStyle]
  static const TextStyle _commonTextStyle = TextStyle(
    color: Colors.red,
    fontFamily: 'Inconsolata',
    fontSize: 48,
    letterSpacing: 1,
  );

  /// コンストラクタ
  const QuestionIndicator({
    Key? key,
  }) : super(key: key);

  /// 描画
  @override
  Widget build(BuildContext context) {
    
    return Consumer<QuizNotifier>(
        builder: (_, notifier, child) {
          return Container(
            padding: const EdgeInsets.only(
              top: 10.0,
              left: 10.0,
              bottom: 10.0,
            ),
            child: _buildQuestion(notifier),
          );
        });
  }

  Widget _buildQuestion(QuizNotifier notifier){
    return Text(
      notifier.correctAnswerAsBinary + "_" +
          notifier.correctAnswerAsDecimal.toString(),
      style: _commonTextStyle,
      textAlign: TextAlign.left,

    );
  }

}
