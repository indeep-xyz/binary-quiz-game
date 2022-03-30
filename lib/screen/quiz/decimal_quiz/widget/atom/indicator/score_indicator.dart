import 'package:binary_quiz_game/model/value_object/numeric/score.dart';
import 'package:binary_quiz_game/service/ui/suitable_font_size.dart';
import 'package:flutter/material.dart';

/// 現在のゲーム中の点数[Score]の表示部品
class ScoreIndicator extends StatelessWidget {
  /// 本ウィジェットの縦横サイズ
  static const double _size = 60;

  /// 本ウィジェットで扱うフォントサイズ
  static const String _fontFamily = "Inconsolata";

  /// 本ウィジェットで扱うフォントサイズ
  static const double _fontBaseSize = 29;

  /// 表示するスコア[Score]
  final Score score;

  final SuitableFontSize fontSize;

  /// コンストラクタ
  ScoreIndicator({
    Key? key,
    required this.score,
  })  : fontSize = SuitableFontSize(_fontFamily, _fontBaseSize),
        super(key: key);

  /// 描画
  @override
  Widget build(BuildContext context) {
    // TODO: スコア上昇時、軽く点滅

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
  }

  /// 点数[Score]の背景の描画
  Widget _buildBackground() {
    return Container(
      decoration: const BoxDecoration(
          shape: BoxShape.circle, boxShadow: [BoxShadow(blurRadius: 2, color: Colors.grey)], color: Colors.yellow),
    );
  }

  /// 点数[Score]の描画
  Widget _buildText(Score score) {
    return Center(
      child: Text(
        "${score.value}",
        style: TextStyle(
          fontFamily: _fontFamily,
          fontSize: fontSize.from(score.value),
          letterSpacing: -1,
        ),
      ),
    );
  }
}
