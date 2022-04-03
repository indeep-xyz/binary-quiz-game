import 'binary_digit.dart';

/// 10進数の回答を扱う値オブジェクト
class DecimalAnswer {
//#region field

  /// 10進数の回答
  final int value;

//#endregion field
//#region constructor

  /// コンストラクタ
  DecimalAnswer(this.value);

//#endregion constructor
//#region to string method

  /// 2進数としての値
  String asBinary(BinaryDigit max) {
    return value.toRadixString(2).padLeft(max.value, "0");
  }

//#endregion to string method
//#region basic method

  /// 文字列変換
  @override
  String toString() {
    return value.toString();
  }

  /// 比較
  @override
  bool operator ==(Object other) {
    return (hashCode == other.hashCode) || (other is DecimalAnswer && value == other.value);
  }

  /// 等価比較
  bool equals( another){
    return value == another.value;
  }

  /// 比較に用いるハッシュコード
  @override
  int get hashCode => super.hashCode;

//#endregion basic method
}