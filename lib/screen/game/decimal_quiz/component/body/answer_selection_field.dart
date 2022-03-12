import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:binary_quiz_game/resource/value_object/binary_digit.dart';
import 'package:binary_quiz_game/resource/value_object/decimal_answer.dart';

import '../../provider/quiz_notifier.dart';
import 'answer_selection_item.dart';

/// 回答欄
class AnswerSelectionField extends StatelessWidget {
  /// コンストラクタ
  const AnswerSelectionField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<QuizNotifier, BinaryDigit>(
        selector: (_, notifier) => notifier.binaryDigit,
        shouldRebuild: (old, current) => old.digit != current.digit,
        builder: (_, binaryDigit, child) {
          return Expanded(
            child: GridView.count(
              crossAxisCount: binaryDigit.digit,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
              scrollDirection: Axis.vertical,
              children: _generateSelectionItems(binaryDigit.binaryPatternCount),
            ),
          );
        });
  }

  /// 回答[DecimalAnswerSelectionItem]一覧の生成
  List<Widget> _generateSelectionItems(int length) =>
      List<Widget>.generate(length, _generateSelectionItem);

  /// 回答[DecimalAnswerSelectionItem]の生成
  Widget _generateSelectionItem(int decimalValue) =>
      AnswerSelectionItem(
        answer: DecimalAnswer(decimalValue),
      );
}
