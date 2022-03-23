import 'dart:math';

import 'binary_digit.dart';

/// 2進数の桁数を扱う値オブジェクト (問題用)
class BinaryQuestionDigit {
  /// ゲームで扱う2進数の最大桁数
  final BinaryDigit value;

  /// ゲームで扱う2進数の最大桁数
  int get digitNumber => value.value;

  /// [value] に応じた2進数のパターン数
  int get binaryPatternCount => value.binaryPatternCount;

  /// [value] に応じた10進数の最大値
  int get maxDecimalNumber => value.maxDecimalNumber;

  /// コンストラクタ
  BinaryQuestionDigit(int source) : value = BinaryDigit(source);
}
