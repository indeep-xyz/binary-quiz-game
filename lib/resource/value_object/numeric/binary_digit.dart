import 'dart:math';

/// 2進数の桁数を扱う値オブジェクト (問題用)
class BinaryDigit {

  /// ゲームで扱う2進数の最大桁数
  final int value;

  /// [value] に応じた2進数のパターン数
  late int _binaryPatternCount;
  int get binaryPatternCount => _binaryPatternCount;

  /// [value] に応じた10進数の最大値
  late int _maxDecimalNumber = binaryPatternCount - 1;
  int get maxDecimalNumber => _maxDecimalNumber;

  /// コンストラクタ
  BinaryDigit(this.value){
    _binaryPatternCount = pow(2, value).toInt();
    _maxDecimalNumber= binaryPatternCount - 1;
  }
}