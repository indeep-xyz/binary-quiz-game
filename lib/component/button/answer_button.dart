import 'package:flutter/material.dart';

import 'button.dart';

/// 回答ボタン用のコンポーネント
class AnswerButton extends StatelessWidget {
  /// ボタンが正解を扱うものか否か
  final bool isCorrectAnswer;

  /// タップ時のスプラッシュアニメーションで用いる色
  final Color splashColor;

  /// 表示する文字列
  final String text;

  /// ボタンタップ時の処理
  final Function() onTap;

  /// コンストラクタ
  const AnswerButton({
    Key? key,
    required this.text,
    required this.onTap,
    required this.isCorrectAnswer,
  })  : splashColor = isCorrectAnswer ? Colors.white : Colors.red,
        super(key: key);

  /// ビルド
  @override
  Widget build(BuildContext context) {
    return Button(
        color: Colors.blue,
        highlightColor: Colors.lightBlue,
        splashColor: splashColor,
        onTap: onTap,
        text: text,
        textStyle: const TextStyle(
          fontFamily: 'Bungee',
          fontSize: 48,
        ));
  }
}
