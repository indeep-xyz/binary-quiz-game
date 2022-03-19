/// 経過時間を扱う値オブジェクト
class ElapsedTime {
  late Duration _value;
  Duration get value => Duration(microseconds: _value.inMicroseconds);

  /// コンストラクタ
  ElapsedTime(Duration duration) {
    if (duration.isNegative) {
      throw ArgumentError.value(duration);
    }

    _value = Duration(microseconds: duration.inMicroseconds);
  }

  /// コンストラクタ (ゼロ用)
  ElapsedTime.zero() {
    _value = Duration.zero;
  }

  /// クローン処理
  ElapsedTime clone() => ElapsedTime(_value);

  /// 加算処理
  ElapsedTime plus(Duration duration) => ElapsedTime(Duration(
      microseconds: _value.inMicroseconds + duration.inMicroseconds));
}
