/// クイズの判定結果を扱う値オブジェクト
class QuizJudgement {
  final bool _value;

  /// 正解か否か
  bool get isCorrect => _value;

  /// コンストラクタ
  QuizJudgement(this._value);
}
