import 'package:binary_quiz_game/widget/molecule/button/general_button.dart';
import 'package:flutter/material.dart';

/// ゲームのリトライ用ボタン
class RetryButton extends StatelessWidget {

  /// コンストラクタ
  const RetryButton({
    Key? key,
  }) : super(key: key);

  /// 描画
  @override
  Widget build(BuildContext context) {
    return GeneralButton(
      text: "Retry",
      onTap: () {
        // ゲームの再開
        Navigator.pushReplacementNamed(context, "decimalQuiz/game");
      }
    );
  }
}