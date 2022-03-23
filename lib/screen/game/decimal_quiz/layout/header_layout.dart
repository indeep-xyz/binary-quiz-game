import 'package:flutter/material.dart';

import '../component/header/question_indicator.dart';
import '../component/header/remaining_time_indicator.dart';
import '../component/header/score_indicator.dart';

/// ゲーム画面中のヘッダ
class HeaderLayout extends StatelessWidget {
  /// コンストラクタ
  const HeaderLayout({
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
