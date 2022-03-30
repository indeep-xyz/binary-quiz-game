import 'package:binary_quiz_game/widget/molecule/button/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:binary_quiz_game/model/value_object/numeric/decimal_answer.dart';

import '../../../model/view_model/quiz_view_model.dart';

class AnswerSelectionItem extends StatelessWidget {
  final DecimalAnswer answer;

  const AnswerSelectionItem({
    Key? key,
    required this.answer,
  }) : super(key: key);

  /// ビルド
  @override
  Widget build(BuildContext context) {
    return Consumer<QuizViewModel>(builder: (_, notifier, child) {
      return AnswerButton(
        isCorrectAnswer: notifier.isCorrectAnswer(answer),
        onTap: () {
          notifier.answer(answer);
        },
        text: answer.value.toString(),
      );
    });
  }
}
