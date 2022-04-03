import 'dart:math';

/// 2進数の桁数を扱う値オブジェクト (問題用)
class BinaryDigit {
//#region field

  /// [value] に応じた2進数のパターン数
  final int binaryPatternCount;

  /// ゲームで扱う2進数の最大桁数
  final int value;

//#endregion field
//#region constructor

  /// コンストラクタ
  BinaryDigit(this.value) : binaryPatternCount = pow(2, value).toInt();

//#endregion constructor
//#region getter method

  /// [value] に応じた10進数の最大値
  int get maxDecimalNumber => binaryPatternCount - 1;

//#endregion getter method
//#region basic method

  /// 文字列変換
  @override
  String toString() {
    return value.toString();
  }

  /// 比較
  @override
  bool operator ==(Object other) {
    return (hashCode == other.hashCode) || (other is BinaryDigit && value == other.value);
  }

  /// 比較に用いるハッシュコード
  @override
  int get hashCode => super.hashCode;

//#endregion basic method
}
