/// ゲームで扱う2進数の桁数の種類
enum BinaryDigitPattern {
  four,
  eight,
  sixteen,
}

/// 桁数の定義
extension BinaryDigitPatternExt on BinaryDigitPattern {
  int get digit {
    switch (this) {
      case BinaryDigitPattern.four:
        return 4;
      case BinaryDigitPattern.eight:
        return 8;
      case BinaryDigitPattern.sixteen:
        return 16;
    }
  }
}
