import 'package:binary_quiz_game/resource/value_object/duration/remaining_time.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/quiz_notifier.dart';

/// 現在のゲーム中の残り時間[RemainingTime]の表示部品
class RemainingTimeIndicator extends StatelessWidget {
  /// 共通のスタイル設定[TextStyle]
  static const TextStyle _commonTextStyle = TextStyle(
    fontFamily: 'Inconsolata',
    fontSize: 20,
    letterSpacing: -1,
  );

  /// コンストラクタ
  const RemainingTimeIndicator({
    Key? key,
  }) : super(key: key);

  /// 描画
  @override
  Widget build(BuildContext context) {
    // TODO: スコア上昇時、軽く点滅

    return Selector<QuizNotifier, RemainingTime>(
        selector: (_, notifier) => notifier.timeElapsing.timeElapsingEntity.remainingTime,
        shouldRebuild: (old, current) => old.value != current.value,
        builder: (_, remainingTime, child) {
          return Container(
            color: Colors.grey[400],
            padding: const EdgeInsets.only(
              top: 3.0,
              bottom: 3.0,
            ),
            width: double.infinity,
            alignment: Alignment.centerRight,
            child: _createText(remainingTime),
          );
        });
  }

  RichText _createText(RemainingTime remainingTime) {
    List<String> rt = remainingTime.toString().split('.');

    return RichText(
        text: TextSpan(
      style: _commonTextStyle,
      children: <TextSpan>[
        _createTextSpan(rt.elementAt(0), true),
        _createTextSpan(".${rt.elementAt(1)}", false),
      ],
    ));
  }

  /// 表示する文字列[text]を、[isInteger]によって整数・小数のスタイル設計を変える
  TextSpan _createTextSpan(String text, bool isInteger) {
    var style = isInteger ? const TextStyle(color: Colors.red) : const TextStyle(color: Colors.black26);
    return TextSpan(text: text, style: style);
  }
}
