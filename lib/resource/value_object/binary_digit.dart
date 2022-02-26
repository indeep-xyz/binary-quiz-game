import 'dart:math';

/// ゲームで扱う2進数の桁数を扱う値オブジェクト
class BinaryDigit {

  /// ゲームで扱う2進数の最大桁数
  final int digit;

  /// [digit] に応じた2進数のパターン数
  late int binaryPatternCount = pow(2, digit).toInt();

  /// [digit] に応じた10進数の最大値
  late int maxDecimalNumber = binaryPatternCount - 1;


  /// コンストラクタ
  BinaryDigit(this.digit);
}