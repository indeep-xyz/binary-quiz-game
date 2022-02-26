import 'package:flutter/material.dart';

import 'question_indicator.dart';
import 'score_indicator.dart';

/// ゲーム画面中のヘッダ
class HeaderContainer extends StatelessWidget {
  /// コンストラクタ
  const HeaderContainer({
    Key? key,
  }) : super(key: key);

  /// 描画
  @override
  Widget build(BuildContext context) {
    // TODO: 配置のバランスを整える (問題中央、スコア右端)

    return Row(
      children: const [
        QuestionIndicator(),
        ScoreIndicator(),
      ],
    );
  }
}
