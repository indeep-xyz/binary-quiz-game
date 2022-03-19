/// 残り時間を扱う値オブジェクト
class RemainingTime {
  late Duration _value;

  Duration get value => Duration(microseconds: _value.inMicroseconds);

  /// コンストラクタ
  RemainingTime(Duration duration) {
    if (duration.isNegative) {
      throw ArgumentError.value(duration);
    }

    _value = Duration(microseconds: duration.inMicroseconds);
  }

  /// コンストラクタ (ゼロ用)
  RemainingTime.zero() {
    _value = Duration.zero;
  }

  /// クローン処理
  RemainingTime clone() => RemainingTime(_value);

  /// 加算処理
  RemainingTime plus(Duration duration) => RemainingTime(
      Duration(microseconds: _value.inMicroseconds + duration.inMicroseconds));

  /// 減算処理
  RemainingTime minus(Duration duration) {
    final d =
        Duration(microseconds: _value.inMicroseconds - duration.inMicroseconds);

    // 負数時、ゼロとして返却
    if (d.isNegative) {
      return RemainingTime.zero();
    }

    // 正数時、減算
    return RemainingTime(d);
  }

  /// 文字列化
  @override
  String toString() {
    var textInSeconds = _value.inSeconds.toString().padLeft(2);
    var textInMilliseconds =
        (_value.inMilliseconds % 1000).toString().padLeft(3, '0');

    return "$textInSeconds.$textInMilliseconds";
  }
}
