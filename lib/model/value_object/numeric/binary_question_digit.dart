import 'binary_digit.dart';

/// 2進数の桁数を扱う値オブジェクト (問題用)
class BinaryQuestionDigit {
//#region field

  /// ゲームで扱う2進数の最大桁数
  final BinaryDigit value;

//#endregion field
//#region constructor

  /// コンストラクタ
  BinaryQuestionDigit(int source) : value = BinaryDigit(source);

//#endregion constructor
//#region getter method

  /// ゲームで扱う2進数の最大桁数
  int get digitNumber => value.value;

  /// [value] に応じた2進数のパターン数
  int get binaryPatternCount => value.binaryPatternCount;

  /// [value] に応じた10進数の最大値
  int get maxDecimalNumber => value.maxDecimalNumber;

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
    return (hashCode == other.hashCode) || (other is BinaryQuestionDigit && value == other.value);
  }

  /// 比較に用いるハッシュコード
  @override
  int get hashCode => super.hashCode;

//#endregion basic method
}
