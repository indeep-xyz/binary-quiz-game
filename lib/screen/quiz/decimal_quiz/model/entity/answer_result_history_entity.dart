import 'package:binary_quiz_game/model/value_object/numeric/decimal_answer.dart';
import 'package:binary_quiz_game/model/value_object/numeric/score.dart';
import 'package:binary_quiz_game/model/value_object/boolean/quiz_judgement.dart';

import 'answer_result_entity.dart';

/// 回答履歴
class AnswerResultHistory {
  /// 履歴
  final List<AnswerResultEntity> _list = [];

  /// コンストラクタ
  AnswerResultHistory();

  /// 履歴の追加
  void add(DecimalAnswer answer, QuizJudgement judgement) {
    _list.add(AnswerResultEntity(answer, judgement));
  }

  /// 正解数
  Score get correctCount {
    return Score(_list.where((ar) => ar.isCorrect).length);
  }

  /// 不正解数
  Score get incorrectCount {
    return Score(_list.where((ar) => !ar.isCorrect).length);
  }

  /// 最後の回答が正解か否か
  bool isLastAnswerCorrect() {
    return _list.isEmpty
        ? false
        : _list.last.isCorrect;
  }
}
