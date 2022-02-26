import 'dart:math';
import 'package:binary_quiz_game/resource/value_object/binary_digit.dart';
import 'package:binary_quiz_game/resource/value_object/decimal_answer.dart';


/// 2進数で問うタイプの問題のエンティティ
class QuestionEntity {
  /// 解答値
  late DecimalAnswer _correctAnswer;

  /// 2進数の桁数
  late BinaryDigit _binaryDigit;

  /// コンストラクタ (乱数による自動生成)
  QuestionEntity.random(BinaryDigit digit){
    _binaryDigit = digit;
    _correctAnswer = DecimalAnswer(Random().nextInt(_binaryDigit.maxDecimalNumber));
  }

  /// 解答値
  DecimalAnswer get correctAnswer {
    return _correctAnswer;
  }

  /// 解答値 (2進数)
  String get correctAnswerAsBinary {
    return _correctAnswer.asBinary(_binaryDigit.digit);
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