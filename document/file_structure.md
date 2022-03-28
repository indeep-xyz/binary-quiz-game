# ファイル構成

## 基本理念

* 全体構造は MVVM (Model-View-ViewModel) の方針で組む。
  * ViewModel は画面固有。
  * ChangeNotifier の継承先は ViewModel として扱う。
* ウィジェットはアトミックデザインを採用する。

## ファイル構成概要

```
* lib
  * constant ..................... 定数
  * model ........................ モデル
    * db_entity .................. テーブル構造と一致したモデル
    * entity ..................... 目的や役割を表現するためのオブジェクト
    * value_object ............... 値オブジェクト
    * view_model ................. ViewModel
  * repository ................... DB操作／通信処理
    * REPOSITORY_CATEGORY_NAME ... DB操作／通信処理分類名
  * service ...................... 処理
    * SERVICE_CATEGORY_NAME ...... 処理分類名
  * screen ....................... 画面単位の処理
    * SCREEN_CATEGORY_NAME ....... 画面分類名
      * SCREEN_NAME .............. 画面名
        * model .................. 画面固有のモデル     (/model と同一構成)
        * service................. 画面固有の処理       (/service と同一構成)
        * widget ................. 画面固有のウィジェット (/widget と同一構成)
  * widget ....................... ウィジェット (atomic design)
    * atom
    * molecule
    * organism
    * page
    * template
      * WIDGET_CATEGORY_NAME .... ウィジェット分類名
```
