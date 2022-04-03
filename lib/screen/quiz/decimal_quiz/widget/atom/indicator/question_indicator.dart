import 'package:flutter/material.dart';

// TODO: FlipCardにて出すようにする
// TODO: 問題変更時、FlipCardを回すようにする
// TODO: 問題変更時、背景を少し色づける (同一問題が続いたとき用)

/// クイズとなる値の表示部品
class QuestionIndicator extends StatelessWidget {
  /// 共通のスタイル設定[TextStyle]
  static const TextStyle _commonTextStyle = TextStyle(
    color: Colors.red,
    fontFamily: 'Inconsolata',
    fontSize: 48,
    letterSpacing: 1,
  );

  /// 回答 (2進数)
  final String binaryValue;

  /// 回答 (10進数)
  final int decimalValue;

  /// コンストラクタ
  const QuestionIndicator({Key? key, required this.binaryValue, required this.decimalValue})
      : super(key: key);

  /// 描画
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10.0,
        left: 10.0,
        bottom: 10.0,
      ),
      child: _buildQuestion(),
    );
  }

  Widget _buildQuestion() {
    return Text(
      binaryValue + "_" + decimalValue.toString(),
      style: _commonTextStyle,
      textAlign: TextAlign.left,
    );
  }
}
