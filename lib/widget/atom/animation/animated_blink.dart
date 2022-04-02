import 'package:flutter/material.dart';

/// 点滅アニメーション[Animation]の作成
class AnimatedBlink extends StatefulWidget {

  /// 点滅回数
  final int blinkCountMax;

  /// 点滅開始から終了までの時間[Duration]
  final Duration duration;

  /// 非点滅時の色
  final Color? initialColor;

  /// 点滅時の色
  final Color? blinkColor;

  /// 描画処理
  /// 渡した点滅実行用の関数[blink]を外から実行し、現在の色[currentColor]を返す
  final Widget Function(BuildContext context, Color? currentColor, Function() blink) builder;

  const AnimatedBlink({
    Key? key,
    required this.builder,
    required this.duration,
    required this.initialColor,
    required this.blinkColor,
    this.blinkCountMax = 2,
  }) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<AnimatedBlink> with SingleTickerProviderStateMixin {
//#region

  late AnimationController _controller;
  late Animation<Color?> _animation;

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
          widget.blinkCountMax,
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
    return widget.builder(context, _animation.value, blink);
  }

  /// 点滅の開始処理
  void blink() {
    _controller.reset();
    _controller.forward();
  }

//#endregion build
}
