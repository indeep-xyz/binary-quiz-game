import 'dart:math';

/// ゲームで扱う2進数の桁数を扱う値オブジェクト
class BinaryDigit {

  /// ゲームで扱う2進数の最大桁数
  final int digit;

  /// [digit] に応じた2進数のパターン数
  late int _binaryPatternCount;
  int get binaryPatternCount => _binaryPatternCount;

  /// [digit] に応じた10進数の最大値
  late int _maxDecimalNumber = binaryPatternCount - 1;
  int get maxDecimalNumber => _maxDecimalNumber;

  /// コンストラクタ
  BinaryDigit(this.digit){
    _binaryPatternCount = pow(2, digit).toInt();
    _maxDecimalNumber= binaryPatternCount - 1;
  }
}