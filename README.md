# emacs

ついつい忘れてしまう使い方をメモします。

## ssh

```
C-x C-f /ssh:user@hostname#port:path
```

## キーバインドとコマンド

```
describe-key
```
コマンド実行後にキーバインドを入力するとコマンド名や、他のキーバインドでの割当、説明などが見える。

```
describe-function
```
コマンド実行後に関数名を入力すると詳細が表示される。

## ブックマーク

ブックマークを登録

```
C-x r m
```

ブックマークを一覧

```
C-x r l
```

削除する場合はそのまま```d```を押して選択し、```x```で確定

## エンコード

保存時のエンコードの設定

```
C-x RET f
utf-8-unix
```

読込時のエンコードの設定

```
C-x RET r
```

## markdown

プレビューする（markdown-preview）

```
C-c C-c p
```

## 矩形編集

範囲選択した後にコマンドを実行

ナンバリング

```
C-x r N
rectangle-number-lines
```

文字の挿入

```
C-x r t
```

## macro

マクロ記録開始

```
F3
```

マクロ記録完了

```
F4
```

マクロに名前をつける

```
name-last-kbd-macro
```

マクロの内容を書き出し

```
insert-kbd-macro
```

## 文字サイズの変更

```
C-x 0
```
を入力してから

* `+`で拡大
* `-`で縮小

※本来は`C-x C-0`

## 大文字小文字の変換

単語の先頭文字を大文字に変換

```
M-c
```

単語を大文字 (uppercase) に変換

```
M-u
```

単語を小文字 (lowercase) に変換

```
M-l
```

## その他

ファイルの再読込

```
F5
```

今日の日付を入力

```
⇧F5
```

複数回の処理の実行
```
C-u [行数] キーバインド
```

4回の処理の実行
```
C-u キーバインド
```

## Macでの設定

Terminal中で起動するために、.bash_profileなどにエイリアスを追加

```
alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
alias guiemacs="/Applications/Emacs.app/Contents/MacOS/Emacs"
```

## 参考

* [地味に便利なEmacsコマンド](http://qiita.com/ongaeshi/items/d78ab6e3e4219b7cd0ab)
* Macでコマンドラインのemacsをインストールする方法
  * [homebrewからインストールできるemacsの違い](https://qiita.com/kokorinosoba/items/ecceaabe07d91c6f2c66)
