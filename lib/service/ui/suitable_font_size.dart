import 'package:binary_quiz_game/model/value_object/numeric/decimal_digit.dart';

/// 文字幅に合わせて適当なフォントサイズに変換する処理
/// コンテナの中央に位置し、あまり空間の余裕がない文字列を対象として想定している
class SuitableFontSize {
  /// 文字幅に従ったフォントサイズ変換表
  static const Map<String, Map<int, double>> map = {
    "Inconsolata": {
      1: 1,
      2: 0.825,
      3: 0.725,
    },
  };

  /// フォント種別の名称
  final String fontFamily;

  /// フォントの基本サイズ
  final double baseSize;

  /// コンストラクタ
  SuitableFontSize(this.fontFamily, this.baseSize);

  /// フォント種別[fontFamily]から、フォントサイズのマップを返却する
  Map<int, double> _getFontSizeMap(){
    var result = map[fontFamily];

    if (result == null){
      throw ArgumentError.value(fontFamily, "My own font family is not found in the font size map.");
    }

    return result;
  }

  /// フォント種別[fontFamily]と文字の横幅[width]から、最適なフォントサイズを返却する
  double _getFontSize(int width){
    var fontSizeMap = _getFontSizeMap();
    return fontSizeMap[width] ?? fontSizeMap.values.last;
  }

  /// 渡された数字[source]の桁数[DecimalDigit]に応じたフォントサイズを返却する
  double from(int source){
    return baseSize * _getFontSize(DecimalDigit.from(source).value);
  }
}
