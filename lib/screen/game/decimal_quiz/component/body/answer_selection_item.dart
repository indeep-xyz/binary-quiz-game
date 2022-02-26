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

  /// 描画
  Widget _render(){
    return GridTile(
      child: Container(
        color: Colors.blue,
        child: Center(
          child: Text(
            answer.value.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 48),
          ),
        ),
      ),
    );
  }

  /// ビルド
  @override
  Widget build(BuildContext context) {
    return Consumer<QuizNotifier>(
      builder: (_, notifier, child) {
        return GestureDetector(
            child: _render(),
            onTap: () {
              // TODO: 不正解時のアニメーションがほしい
              notifier.answer(answer);
            }
        );
      }
    );
  }
}
