import 'package:binary_quiz_game/resource/value_object/numeric/decimal_digit.dart';
import 'package:binary_quiz_game/resource/value_object/score.dart';
import 'package:binary_quiz_game/screen/game/decimal_quiz/component/header/score_indicator_font_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/quiz_notifier.dart';

/// 現在のゲーム中の点数[Score]の表示部品
class ScoreIndicator extends StatelessWidget {
  /// 本ウィジェットの縦横サイズ
  static const double _size = 60;

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
              width: _size,
              height: _size,
              margin: const EdgeInsets.only(
                right: 10.0,
              ),
              child: Stack(children: <Widget>[
                _buildBackground(),
                _buildText(score),
              ]));
        });
  }

  /// 点数[Score]の背景の描画
  Widget _buildBackground() {
    return Container(
      decoration: const BoxDecoration(shape: BoxShape.circle, boxShadow: [BoxShadow(blurRadius: 2, color: Colors.grey)], color: Colors.yellow),
    );
  }

  /// 点数[Score]の描画
  Widget _buildText(Score score) {
    return Center(
      child: Text(
        "${score.value}",
        style: TextStyle(
          fontFamily: 'Inconsolata',
          fontSize: ScoreIndicatorFontSize.from(score.value).toSize(),
          letterSpacing: -1,
        ),
      ),
    );
  }
}
