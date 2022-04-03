/// 10進数の桁数を扱う値オブジェクト
class DecimalDigit {
//#region field

  /// 10新桁数
  final int value;

//#endregion field
//#region constructor

  /// コンストラクタ (数値から絶対値の桁数を設定する)
  DecimalDigit.from(int source) : value = source.abs().toString().length;

//#endregion constructor
//#region basic method

  /// 文字列変換
  @override
  String toString() {
    return value.toString();
  }

  /// 比較
  @override
  bool operator ==(Object other) {
    return (hashCode == other.hashCode) || (other is DecimalDigit && value == other.value);
  }

  /// 比較に用いるハッシュコード
  @override
  int get hashCode => super.hashCode;

//#endregion basic method
}
