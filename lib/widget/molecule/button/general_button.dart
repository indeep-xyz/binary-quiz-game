import 'package:flutter/material.dart';

import '../../atom/button/button.dart';

/// 回答ボタン用のコンポーネント
class GeneralButton extends StatelessWidget {
  /// 表示する文字列
  final String text;

  /// ボタンタップ時の処理
  final Function() onTap;

  /// コンストラクタ
  const GeneralButton({
    Key? key,
    required this.text,
    required this.onTap,
  })  : super(key: key);

  /// ビルド
  @override
  Widget build(BuildContext context) {
    return Button(
        color: Colors.white,
        highlightColor: Colors.grey,
        splashColor: Colors.grey,
        onTap: onTap,
        text: text,
        textStyle: const TextStyle(
          fontFamily: 'Inconsolata',
          fontSize: 40,
        ));
  }
}
