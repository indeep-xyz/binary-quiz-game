/// 10進数の回答を扱う値オブジェクト
class DecimalAnswer {
  final int value;

  /// コンストラクタ
  DecimalAnswer(this.value);

  /// 等価比較
  bool equals(DecimalAnswer another){
    return value == another.value;
  }

  /// 2進数としての値
  String asBinary(int maxDigit) {
    return value.toRadixString(2).padLeft(maxDigit, "0");
  }
}