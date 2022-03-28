import 'package:binary_quiz_game/model/value_object/duration/elapsed_time.dart';
import 'package:binary_quiz_game/model/value_object/duration/remaining_time.dart';

/// ゲーム中の時間経過を扱うクラス
class TimeElapsingEntity {
//#region field

  /// 残り時間
  late RemainingTime _remainingTime;

  /// 経過時間
  late ElapsedTime _elapsedTime;

//#endregion field
//#region getter

  /// 経過時間
  ElapsedTime get elapsedTime => _elapsedTime.clone();

  /// 残り時間
  RemainingTime get remainingTime => _remainingTime.clone();

  /// タイマーの残り時間があるか否か
  bool get hasRemainingTime => _remainingTime.value.inMicroseconds > 0;

//#endregion getter
//#region constructor

  /// コンストラクタ
  TimeElapsingEntity({required RemainingTime remainingTime, required ElapsedTime elapsedTime})
      : _remainingTime = RemainingTime(remainingTime.value),
        _elapsedTime = ElapsedTime(elapsedTime.value);

  /// コンストラクタ (経過の起点がない状態)
  TimeElapsingEntity.first(Duration remainingTime)
      : _remainingTime = RemainingTime(remainingTime),
        _elapsedTime = ElapsedTime.zero();

//#endregion constructor
//#region clone

  /// クローン
  TimeElapsingEntity clone() => TimeElapsingEntity(remainingTime: _remainingTime, elapsedTime: _elapsedTime);

//#endregion clone
//#region update time field

  /// 残り時間の回復処理
  void increaseRemainingTime(Duration duration) {
    _remainingTime = _remainingTime.plus(duration);
  }

  /// 各種時間の更新
  void elapse(Duration duration) {
    _remainingTime = _remainingTime.minus(duration);
    _elapsedTime = _elapsedTime.plus(duration);
  }
//#endregion update time field
}
