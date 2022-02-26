import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/quiz_notifier.dart';

/// クイズとなる値の表示部品
class QuestionIndicator extends StatelessWidget {

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
              top: 20.0,
              bottom: 20.0,
            ),
            child: Text(
              notifier.correctAnswerAsBinary + "_" +
                  notifier.correctAnswerAsDecimal.toString(),
              style: const TextStyle(fontSize: 48, color: Colors.red),
            ),
          );
        });
  }
}
