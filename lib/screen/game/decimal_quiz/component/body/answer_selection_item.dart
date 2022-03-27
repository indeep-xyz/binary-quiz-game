import 'package:binary_quiz_game/component/button/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:binary_quiz_game/resource/value_object/decimal_answer.dart';

import '../../provider/quiz_notifier.dart';

class AnswerSelectionItem extends StatelessWidget {
  final DecimalAnswer answer;

  const AnswerSelectionItem({
    Key? key,
    required this.answer,
  }) : super(key: key);

  /// ビルド
  @override
  Widget build(BuildContext context) {
    return Consumer<QuizNotifier>(builder: (_, notifier, child) {
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
