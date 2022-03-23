import 'dart:async';

import 'package:binary_quiz_game/resource/entity/time_elapsing_entity.dart';
import 'package:binary_quiz_game/resource/value_object/duration/remaining_time.dart';

/// ゲーム中の時間経過を扱うクラス
class TimeElapsingService {
//#region static field
  /// タイマーの更新間隔
  static const Duration _timerTick = Duration(milliseconds: 50);

//#endregion static field
//#region field

  /// 残り時間を完全に失ったときに呼び出す処理
  final Function() callbackOnTimerEnd;

  /// 時間経過処理の更新毎に呼び出す処理
  final Function(Timer) callbackOnTimerTick;

  /// 経過時間
  late TimeElapsingEntity _timeElapsingEntity;

  /// タイマー
  Timer? _timer;

  /// タイマーの更新ごとの経過時間を測るためのストップウォッチ
  final Stopwatch _stopwatch = Stopwatch();

//#endregion field
//#region getter

  /// 経過時間
  TimeElapsingEntity get timeElapsingEntity => _timeElapsingEntity.clone();

//#endregion getter
//#region constructor

  /// コンストラクタ
  TimeElapsingService({
    required this.callbackOnTimerEnd,
    required this.callbackOnTimerTick,
    required Duration remainingTime,
  }) : _timeElapsingEntity = TimeElapsingEntity.first(remainingTime);

//#endregion constructor
//#region dispose

  /// 破棄
  void dispose() {
    _timer?.cancel();
    _stopwatch.stop();
  }

//#endregion dispose
//#region timer lifecycle

  /// タイマー処理の開始
  void startTimer() {
    // 以前のタイマーがあれば破棄
    _timer?.cancel();

    // ストップウォッチの開始
    _restartStopwatch();

    // タイマーの起動
    _timer = Timer.periodic(_timerTick, _timerTickHandler);
  }

  /// ストップウォッチをリスタートし、前回からの経過時間[Duration]を返却する
  ///
  /// [Timer.periodic]に渡した更新間隔[Duration]では測れない
  /// 正確なタイマーの更新間隔を得ることが目的
  Duration _restartStopwatch() {
    var d = _stopwatch.elapsed;
    _stopwatch.reset();
    _stopwatch.start();

    return d;
  }

  /// タイマーの更新処理
  void _timerTickHandler(Timer timer) {
    _timeElapsingEntity.elapse(_restartStopwatch());

    if (_timeElapsingEntity.hasRemainingTime) {
      // 残り時間があるときの処理
      callbackOnTimerTick(timer);
    } else {
      // 残り時間を完全に失ったときの処理
      _timer?.cancel();
      callbackOnTimerEnd();
    }
  }

//#endregion timer lifecycle
//#region modify remaining time

  /// 残り時間[RemainingTime]の回復処理
  void increaseRemainingTime(Duration duration) {
    _timeElapsingEntity.increaseRemainingTime(duration);
  }

//#endregion modify remaining time
}
