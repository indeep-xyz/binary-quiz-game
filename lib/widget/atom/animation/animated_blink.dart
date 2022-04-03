import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

/// 点滅アニメーション[Animation]の作成
class AnimatedBlink extends StatefulWidget {
  /// 描画処理
  final Widget Function(BuildContext context, Color? currentColor) builder;

  /// 点滅処理の起点となる依存値
  final List<dynamic> dependencies;

  /// 初回描画時に点滅を行うか否か
  final bool doesBlinkWhenFirstBuild;

  /// 点滅開始から終了までの時間[Duration]
  final Duration duration;

  /// 非点滅時の色
  final Color? initialColor;

  /// 点滅時の色
  final Color? blinkColor;

  /// 点滅回数
  final int repeat;

  const AnimatedBlink({
    Key? key,
    required this.builder,
    required this.duration,
    required this.initialColor,
    required this.blinkColor,
    required this.dependencies,
    this.doesBlinkWhenFirstBuild = true,
    this.repeat = 2,
  }) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<AnimatedBlink> with SingleTickerProviderStateMixin {
//#region

  late AnimationController _controller;
  late Animation<Color?> _animation;

  /// 直近に点滅した際の依存値
  List<dynamic> lastDependencies = [];

//#endregion field
//#region initialize

  @override
  void initState() {
    super.initState();

    // 初期化
    _initializeAnimationController();
    _initializeAnimation();

    super.initState();
  }

  /// [AnimationController]の初期化
  _initializeAnimationController() {
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
  }

  /// [Animation]の初期化
  _initializeAnimation() {
    _animation = TweenSequence<Color?>([
      // 点滅
      ...List.filled(
          widget.repeat,
          TweenSequenceItem(
            tween: ColorTween(begin: widget.initialColor, end: widget.blinkColor),
            weight: 5,
          )),

      // 点滅後、最初の色に戻す
      TweenSequenceItem(
        tween: ColorTween(begin: widget.initialColor, end: widget.initialColor),
        weight: 1,
      )
    ]).animate(_controller);
  }

  /// 廃棄
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

//#endregion initialize
//#region build

  /// 描画処理
  @override
  Widget build(BuildContext context) {
    var eq = const ListEquality();

    if (!eq.equals(lastDependencies, widget.dependencies)) {
      // 依存値[lastDependencies]の変更時のみ点滅処理
      if (_doesBlink()) {
        _blink();
      }

      // 依存値の更新
      lastDependencies = widget.dependencies;
    }

    return widget.builder(context, _animation.value);
  }

  /// 点滅の開始処理
  void _blink() {
    _controller.reset();
    _controller.forward();
  }

  /// 点滅の開始判定
  /// 本メソッドは、依存値の更新判定処理後に実施するものとする
  bool _doesBlink() {
    if (widget.doesBlinkWhenFirstBuild){
      // 初回描画時の点滅を避けない場合
      // 常に点滅を行う
      return true;
    }

    // 初回描画時の点滅を避ける場合
    // 依存値が空欄の場合を初回描画時とし、その状況の場合のみ点滅を行わない
    return widget.dependencies.isNotEmpty;
  }

//#endregion build
}
