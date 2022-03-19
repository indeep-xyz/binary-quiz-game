import 'package:binary_quiz_game/resource/value_object/duration/remaining_time.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/quiz_notifier.dart';

/// 現在のゲーム中の残り時間[RemainingTime]の表示部品
class RemainingTimeIndicator extends StatelessWidget {
  /// コンストラクタ
  const RemainingTimeIndicator({
    Key? key,
  }) : super(key: key);

  /// 描画
  @override
  Widget build(BuildContext context) {
    // TODO: スコア上昇時、軽く点滅

    return Selector<QuizNotifier, RemainingTime>(
        selector: (_, notifier) =>
            notifier.timeElapsing.timeElapsingEntity.remainingTime,
        shouldRebuild: (old, current) => old.value != current.value,
        builder: (_, remainingTime, child) {
          return Container(
            padding: const EdgeInsets.only(
              top: 20.0,
              bottom: 20.0,
            ),
            child: _createText(remainingTime),
          );
        });
  }

  Text _createText(RemainingTime remainingTime) {
    return Text(
      remainingTime.toString(),
      style: const TextStyle(fontSize: 20, color: Colors.deepOrange),
    );
  }
}
