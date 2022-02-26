import 'package:binary_quiz_game/resource/value_object/decimal_answer.dart';
import 'package:binary_quiz_game/resource/value_object/quiz_judgement.dart';
import 'package:binary_quiz_game/resource/value_object/score.dart';

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
}
