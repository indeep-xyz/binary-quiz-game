import 'package:binary_quiz_game/widget/atom/animation/animated_blink.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/view_model/quiz_view_model.dart';
import '../../atom/indicator/question_indicator.dart';
import '../../atom/indicator/remaining_time_indicator.dart';
import '../../atom/indicator/score_indicator.dart';

/// ゲーム画面中のヘッダ
class HeaderLayout extends StatelessWidget {
  /// コンストラクタ
  const HeaderLayout({
    Key? key,
  }) : super(key: key);

  /// 描画
  @override
  Widget build(BuildContext context) {
    // TODO: 配置のバランスを整える (問題中央、スコア右端)

    return Consumer<QuizViewModel>(builder: (_, notifier, child) {
      return Stack(children: [
        Container(
          color: Colors.grey[300],
          width: double.infinity,
          height: 100,
        ),
        Column(
          children: [
            RemainingTimeIndicator(remainingTime: notifier.timeElapsing.timeElapsingEntity.remainingTime),
            Row(
              children: [
                Expanded(
                  flex: 8,
                  child: QuestionIndicator(
                    binaryValue: notifier.correctAnswerAsBinary,
                    decimalValue: notifier.correctAnswerAsDecimal,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: AnimatedBlink(
                    duration: const Duration(milliseconds: 300),
                    initialColor: Colors.yellow,
                    blinkColor: Colors.orange[400],
                    builder: (_, color, blink) {
                      notifier.addCorrectFunction(blink);
                      return ScoreIndicator(score: notifier.correctCount, backgroundColor:color);
                    },
                  ),
                ),
              ],
            )
          ],
        )
      ]);
    });
  }
}
