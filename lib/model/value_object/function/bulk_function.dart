/// 関数群の保持・実行
class BulkFunction {

  /// 関数群
  final List<Function()> _functions = [];

  /// 保持している処理[_functions_]をすべて実行する
  /// 実行順序は追加[add]された順
  void runAll() {
    for (var f in _functions) {
      f();
    }
  }

  /// 処理[func]を関数群[_functions_]を追加する。既に追加済みの処理は追加されない
  void add(Function() func) {
    if (!_functions.contains(func)) {
      _functions.add(func);
    }
  }

  /// 保持している処理[_functions_]内の１つを削除する
  void remove(Function() func) {
    var index = _functions.indexOf(func);

    if (index > -1) {
      _functions.removeAt(index);
    }
  }

  /// 保持している処理[_functions_]を全削除する
  void clear() {
    _functions.clear();
  }
}
