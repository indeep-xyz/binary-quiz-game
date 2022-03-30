import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:binary_quiz_game/model/value_object/numeric/binary_question_digit.dart';
import 'package:binary_quiz_game/model/value_object/numeric/decimal_answer.dart';

import '../../../model/view_model/quiz_view_model.dart';
import 'answer_selection_item.dart';

/// 回答欄
class AnswerSelectionField extends StatelessWidget {
  /// コンストラクタ
  const AnswerSelectionField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<QuizViewModel, BinaryQuestionDigit>(
        selector: (_, notifier) => notifier.binaryQuestionDigit,
        shouldRebuild: (old, current) => old.value != current.value,
        builder: (_, binaryDigit, child) {
          return Expanded(
            child: GridView.count(
              crossAxisCount: binaryDigit.digitNumber,
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
