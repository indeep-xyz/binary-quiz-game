/// 10進数の回答を扱う値オブジェクト
class DecimalAnswer {
  final int _value;
  int get value => _value;

  /// コンストラクタ
  DecimalAnswer(this._value);

  /// 等価比較
  bool equals(DecimalAnswer another){
    return value == another.value;
  }

  /// 2進数としての値
  String asBinary(int maxDigit) {
    return _value.toRadixString(2).padLeft(maxDigit, "0");
  }
}