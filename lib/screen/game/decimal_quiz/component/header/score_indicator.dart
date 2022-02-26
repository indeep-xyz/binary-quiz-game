import 'package:binary_quiz_game/resource/value_object/score.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/quiz_notifier.dart';

/// 現在のゲーム中の点数[Score]の表示部品
class ScoreIndicator extends StatelessWidget {
  /// コンストラクタ
  const ScoreIndicator({
    Key? key,
  }) : super(key: key);

  /// 描画
  @override
  Widget build(BuildContext context) {
    // TODO: スコア上昇時、軽く点滅

    return Selector<QuizNotifier, Score>(
        selector: (_, notifier) => notifier.correctCount,
        shouldRebuild: (old, current) => old.value != current.value,

        builder: (_, score, child) {
          return Container(
            padding: const EdgeInsets.only(
              top: 20.0,
              bottom: 20.0,
            ),
            child: Text(
              "${score.value}",
              style: const TextStyle(fontSize: 10),
            ),
          );
        }
    );
  }
}