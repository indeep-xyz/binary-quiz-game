import 'package:binary_quiz_game/resource/value_object/quiz_judgement.dart';
import 'package:binary_quiz_game/resource/value_object/decimal_answer.dart';

/// 回答結果
class AnswerResultEntity {
  /// 回答結果
  final DecimalAnswer _answer;

  DecimalAnswer get value => _answer;

  /// 正解か否か
  final QuizJudgement _judgement;

  bool get isCorrect => _judgement.isCorrect;

  /// 回答結果
  AnswerResultEntity(
    this._answer,
    this._judgement,
  );

  /// 回答が一致するか否か
  bool isMatched(DecimalAnswer another) {
    return value.equals(another);
  }
}
