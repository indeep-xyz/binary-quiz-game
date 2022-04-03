import 'dart:math';
import 'package:binary_quiz_game/model/value_object/numeric/binary_question_digit.dart';
import 'package:binary_quiz_game/model/value_object/numeric/decimal_answer.dart';

/// 2進数で問うタイプの問題のエンティティ
class QuestionEntity {
  /// 解答値
  final DecimalAnswer _correctAnswer;

  /// 2進数の桁数
  final BinaryQuestionDigit binaryQuestionDigit;

  /// コンストラクタ (乱数による自動生成)
  QuestionEntity.random(this.binaryQuestionDigit)
      : _correctAnswer = DecimalAnswer(Random().nextInt(binaryQuestionDigit.maxDecimalNumber));

  /// 解答値
  DecimalAnswer get correctAnswer {
    return _correctAnswer;
  }

  /// 解答値 (2進数)
  String get correctAnswerAsBinary {
    return _correctAnswer.asBinary(binaryQuestionDigit.value);
  }

  /// 解答値 (10進数)
  int get correctAnswerAsDecimal {
    return _correctAnswer.value;
  }

  /// 解答比較
  bool isCorrect(DecimalAnswer answer) {
    return _correctAnswer.equals(answer);
  }
}
