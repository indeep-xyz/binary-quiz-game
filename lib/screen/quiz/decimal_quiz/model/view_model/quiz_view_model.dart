import 'dart:async';

import 'package:binary_quiz_game/constant/binary_digit_pattern.dart';
import 'package:binary_quiz_game/model/value_object/function/bulk_function.dart';
import 'package:binary_quiz_game/service/duration/time_elapsing_service.dart';
import 'package:binary_quiz_game/model/value_object/numeric/binary_question_digit.dart';
import 'package:binary_quiz_game/model/value_object/numeric/decimal_answer.dart';
import 'package:binary_quiz_game/model/value_object/numeric/score.dart';
import 'package:binary_quiz_game/model/value_object/boolean/quiz_judgement.dart';
import 'package:flutter/material.dart';

import '../entity/answer_result_history_entity.dart';
import '../entity/question_entity.dart';

/// クイズ状況の通知処理
class QuizViewModel extends ChangeNotifier {
//#region static field

  /// 残り時間の初期値
  static const Duration _initialRemainingTime = Duration(seconds: 30);

  /// 正答時の残り時間加算時間
  static const Duration _recoverRemainingTime = Duration(seconds: 3);

//#endregion static field
//#region field

  /// [ChangeNotifierProvider.create] 時のビルドコンテキスト
  final BuildContext buildContext;

  /// 今回のゲーム中の回答履歴
  final AnswerResultHistory _history = AnswerResultHistory();

  /// ゲームの問題として扱う2進数の桁数
  final BinaryQuestionDigit binaryQuestionDigit = BinaryQuestionDigit(BinaryDigitPattern.four.digit);

  /// 出題中の問題
  late QuestionEntity _currentQuestion;

  /// 時間経過を扱うエンティティ
  late TimeElapsingService _timeElapsingService;

  /// 正解時に実行する処理群
  final BulkFunction _correctFunctions;

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

  /// コンストラクタ
  QuizViewModel(this.buildContext) : _correctFunctions = BulkFunction() {
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
//#region set function

  /// 正解時処理の追加
  void addCorrectFunction(Function() func) {
    _correctFunctions.add(func);
  }

//#endregion set function
//#region timer

  /// 時間経過処理の開始
  void _startTimeElapsing() {
    _timeElapsingService = TimeElapsingService(
      remainingTime: _initialRemainingTime,
      callbackOnTimerEnd: () {
        // ゲームの終了
        Navigator.pushReplacementNamed(buildContext, "decimalQuiz/result");
        notifyListeners();
      },
      callbackOnTimerTick: (Timer _) => notifyListeners(),
    );

    _timeElapsingService.startTimer();
  }

//#endregion timer
//#region question and answer

  /// 問題の更新
  void _nextQuestion() {
    _currentQuestion = QuestionEntity.random(binaryQuestionDigit);
  }

  /// 回答履歴の追加
  void _addHistory(DecimalAnswer answer) {
    // 回答履歴の追加
    _history.add(answer, QuizJudgement(_currentQuestion.isCorrect(answer)));

    if (_history.isLastAnswerCorrect()) {
      // 正解

      // 次の問題の準備
      _nextQuestion();

      // 残り時間の回復
      if (_timeElapsingService.timeElapsingEntity.hasRemainingTime) {
        _timeElapsingService.increaseRemainingTime(_recoverRemainingTime);
      }

      // 正解時に実行する処理群の呼び出し
      _correctFunctions.runAll();
    } else {
      // 不正解

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
  bool isLastAnswerCorrect() => _history.isLastAnswerCorrect();

//#endregion question and answer
}
