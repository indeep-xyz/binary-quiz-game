import 'package:binary_quiz_game/resource/constant/binary_digit_pattern.dart';
import 'package:binary_quiz_game/resource/value_object/binary_digit.dart';
import 'package:binary_quiz_game/resource/value_object/decimal_answer.dart';
import 'package:binary_quiz_game/resource/value_object/quiz_judgement.dart';
import 'package:binary_quiz_game/resource/value_object/score.dart';
import 'package:flutter/foundation.dart';

import '../resource/entity/answer_result_history_entity.dart';
import '../resource/entity/question_entity.dart';

/// クイズ状況の通知処理
class QuizNotifier extends ChangeNotifier {
  final AnswerResultHistory _history = AnswerResultHistory();
  final BinaryDigit binaryDigit = BinaryDigit(BinaryDigitPattern.four.digit);

  late QuestionEntity _question;

  QuizNotifier() {
    _nextQuestion();
  }

  /// 問題の更新
  void _nextQuestion() {
    _question = QuestionEntity.random(binaryDigit);
  }

  /// 回答履歴の追加
  void _addHistory(DecimalAnswer answer) {
    if (_question.isCorrect(answer)) {
      // 正解
      _history.add(answer, QuizJudgement(true));
      _nextQuestion();
    } else {
      // 不正解
      _history.add(answer, QuizJudgement(false));
    }
  }

  /// 回答
  void answer(DecimalAnswer answer) {
    _addHistory(answer);
    notifyListeners();
  }

  /// 正解数
  Score get correctCount => _history.correctCount;

  /// 不正解数
  Score get incorrectCount => _history.incorrectCount;

  /// 現在のクイズの正解 (2進数)
  String get correctAnswerAsBinary => _question.correctAnswerAsBinary;

  /// 現在のクイズの正解 (10進数)
  int get correctAnswerAsDecimal => _question.correctAnswerAsDecimal;

  /// 回答確認
  bool isCorrectAnswer(DecimalAnswer answer) => _question.isCorrect(answer);

  /// 最後の回答が正解か否か
  bool isLastAnswerCorrect(DecimalAnswer answer) =>
      _history.isLastAnswerCorrect(answer);
}
