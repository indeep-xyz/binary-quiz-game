import 'package:flutter/material.dart';

/// ボタン用のコンポーネント
class Button extends StatelessWidget {
  /// 背景色
  final Color color;

  /// プレス時の背景色
  final Color highlightColor;

  /// タップ時のスプラッシュアニメーションで用いる色
  final Color splashColor;

  /// 表示する文字列
  final String text;

  /// 表示する文字列のスタイル
  final TextStyle textStyle;

  /// ボタンタップ時の処理
  final Function() onTap;

  /// コンストラクタ
  const Button({
    Key? key,
    required this.color,
    required this.highlightColor,
    required this.splashColor,
    required this.text,
    required this.textStyle,
    required this.onTap,
  }) : super(key: key);

  /// ビルド
  @override
  Widget build(BuildContext context) {
    return Material(
        // 角丸
        borderRadius: BorderRadius.circular(10),

        // 影
        elevation: 8,

        color: color,
        type: MaterialType.button,
        child: InkWell(
            highlightColor: highlightColor,
            onTap: onTap,
            splashColor: splashColor,
            child: Center(
              child: Text(
                text,
                style: textStyle,
                textAlign: TextAlign.center,
              ),
            )));
  }
}
