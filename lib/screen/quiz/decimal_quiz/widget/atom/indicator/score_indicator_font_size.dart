import 'package:binary_quiz_game/model/value_object/numeric/decimal_digit.dart';
import 'package:binary_quiz_game/model/value_object/score.dart';

/// 現在のゲーム中の点数[Score]のフォントサイズ
class ScoreIndicatorFontSize {
  /// 文字の桁数に従ったフォントサイズ
  static const Map<int, double> map = {
    1: 29.0,
    2: 24.0,
    3: 21.0,
  };

  /// 10進数の桁数
  final DecimalDigit decimalDigit;

  /// コンストラクタ
  ScoreIndicatorFontSize.from(int source) : decimalDigit = DecimalDigit.from(source);

  /// フォントサイズを表す値を返す
  double toSize(){
    return map[decimalDigit.value] ?? map.values.last;
  }
}
