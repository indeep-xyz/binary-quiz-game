import 'package:flutter/material.dart';

import 'question_indicator.dart';
import 'remaining_time_indicator.dart';
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

    return Stack(
    children: [
      Container(
        color: Colors.grey[300],
        width: double.infinity,
        height: 100,
      ),
      Column(
      children: [
        const RemainingTimeIndicator(),
        Row(
          children: const [
            Expanded(
              flex: 8,
              child: QuestionIndicator(),
            ),
            Expanded(
              flex: 1,
              child: ScoreIndicator(),
            ),
          ],
        )
      ],
    )]);
  }
}
