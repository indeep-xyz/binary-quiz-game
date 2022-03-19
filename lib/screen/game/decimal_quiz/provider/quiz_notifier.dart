import 'dart:async';

import 'package:binary_quiz_game/resource/constant/binary_digit_pattern.dart';
import 'package:binary_quiz_game/resource/service/time_elapsing_service.dart';
import 'package:binary_quiz_game/resource/value_object/binary_digit.dart';
import 'package:binary_quiz_game/resource/value_object/decimal_answer.dart';
import 'package:binary_quiz_game/resource/value_object/quiz_judgement.dart';
import 'package:binary_quiz_game/resource/value_object/score.dart';
import 'package:flutter/foundation.dart';

import '../resource/entity/answer_result_history_entity.dart';
import '../resource/entity/question_entity.dart';

/// クイズ状況の通知処理
class QuizNotifier extends ChangeNotifier {
//#region static field

  /// 残り時間の初期値
  static const Duration _initialRemainingTime = Duration(seconds: 30);

  /// 正答時の残り時間加算時間
  static const Duration _recoverRemainingTime = Duration(seconds: 3);

//#endregion static field
//#region field

  /// 今回のゲーム中の回答履歴
  final AnswerResultHistory _history = AnswerResultHistory();

  /// ゲームの問題として扱う2進数の桁数
  final BinaryDigit binaryDigit = BinaryDigit(BinaryDigitPattern.four.digit);

  /// 出題中の問題
  late QuestionEntity _currentQuestion;

  /// 時間経過を扱うエンティティ
  late TimeElapsingService _timeElapsingService;

//#endregion field
//#region getter

  /// 時間経過処理
  TimeElapsingService get timeElapsing => _timeElapsingService;

  /// 正解数
  Score get correctCount => _history.correctCount;

  /// 不正解数
  Score get incorrectCount => _history.incorrectCount;

  /// 現在のクイズの正解 (2進数)
  String get correctAnswerAsBinary => _currentQuestion.correctAnswerAsBinary;

  /// 現在のクイズの正解 (10進数)
  int get correctAnswerAsDecimal => _currentQuestion.correctAnswerAsDecimal;

//#endregion getter
//#region constructor

  QuizNotifier() {
    _nextQuestion();
    _startTimeElapsing();
  }

//#endregion constructor
//#region dispose

  @override
  void dispose() {
    _timeElapsingService.dispose();
    super.dispose();
  }

//#endregion dispose
//#region timer

  /// 時間経過処理の開始
  void _startTimeElapsing() {
    _timeElapsingService = TimeElapsingService(
      remainingTime: _initialRemainingTime,
      callbackOnTimerEnd: () => notifyListeners(),
      callbackOnTimerTick: (Timer _) => notifyListeners(),
    );

    _timeElapsingService.startTimer();
  }

//#endregion timer
//#region question and answer

  /// 問題の更新
  void _nextQuestion() {
    _currentQuestion = QuestionEntity.random(binaryDigit);
  }

  /// 回答履歴の追加
  void _addHistory(DecimalAnswer answer) {
    if (_currentQuestion.isCorrect(answer)) {
      // 正解

      // 回答履歴の追加と、次の問題の準備
      _history.add(answer, QuizJudgement(true));
      _nextQuestion();

      // 残り時間の回復
      if(_timeElapsingService.timeElapsingEntity.hasRemainingTime) {
        _timeElapsingService.increaseRemainingTime(_recoverRemainingTime);
      }

    } else {
      // 不正解

      // 回答履歴の追加
      _history.add(answer, QuizJudgement(false));
    }
  }

  /// 回答
  void answer(DecimalAnswer answer) {
    _addHistory(answer);
    notifyListeners();
  }
  /// 回答確認
  bool isCorrectAnswer(DecimalAnswer answer) => _currentQuestion.isCorrect(answer);

  /// 最後の回答が正解か否か
  bool isLastAnswerCorrect(DecimalAnswer answer) =>
      _history.isLastAnswerCorrect(answer);

//#endregion question and answer
}
