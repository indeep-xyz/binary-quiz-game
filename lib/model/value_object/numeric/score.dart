/// 点数の値オブジェクト
class Score {
//#region field

  /// 点数
  final int value;

//#endregion field
//#region constructor

  /// コンストラクタ
  Score(this.value);

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
    return (hashCode == other.hashCode) || (other is Score && value == other.value);
  }

  /// 比較に用いるハッシュコード
  @override
  int get hashCode => super.hashCode;

//#endregion basic method
}
