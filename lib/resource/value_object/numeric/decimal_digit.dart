/// 10進数の桁数を扱う値オブジェクト
class DecimalDigit {
  /// 10新桁数
  final int value;

  /// コンストラクタ (数値から絶対値の桁数を設定する)
  DecimalDigit.from(int source) : value = source.abs().toString().length;
}
