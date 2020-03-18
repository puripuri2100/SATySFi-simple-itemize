# このパッケージの役割

SATySFiの`itemize`型ではなく`inline-text list`を用いて簡単に箇条書きが書けるパッケージです。

# このリポジトリにあるパッケージ

- simple-itemize.satyh

# インストール方法

```
opam pin add "git+https://github.com/puripuri2100/SATySFi-simple-itemize.git"

opam install satysfi-simple-itemize

satyrographos install
```

# モジュール名

`SimpleItemize`

# 提供コマンド

  `direct \item : [inline-text?; (context -> int list -> inline-text -> inline-boxes)?; bool?; inline-text] inline-cmd`
  `direct +listing : [(context -> int list -> inline-text -> inline-boxes)?; bool?; inline-text list] block-cmd`
  `direct +enumerate : [(context -> int list -> inline-text -> inline-boxes)?; bool?; inline-text list] block-cmd`
  `direct +description : [(context -> int list -> inline-text -> inline-boxes)?; bool?; inline-text list] block-cmd`
  `direct \listing : [(context -> int list -> inline-text -> inline-boxes)?; bool?; inline-text list] inline-cmd`
  `direct \enumerate : [(context -> int list -> inline-text -> inline-boxes)?; bool?; inline-text list] inline-cmd`
  `direct \description : [(context -> int list -> inline-text -> inline-boxes)?; bool?; inline-text list] inline-cmd`

# 基本的な使い方

```
+listing{|
  \item{text} |
  \item?:({title}){text}
|}
```

のように`inline-text list`の中に`\item`コマンドを書きます。
`\item`コマンドでは主にテキストを書きます。
入れ子構造にしたいときは、

```
+listing{|
  \item{text
    \listing{|
      \item{text2}
    |}
  } |
  \item{text}
|}
```

のように、中に書きます。`liting`の中に`enumerate`や`description`を書くなどしても大丈夫ですが、深さはリセットされます。

`description`や`lisging`ではタイトルを付けるときがありますが、そのときは`inline-text`のオプション引数を与えてください。

# デザインのカスタマイズ

- `\item ?* ?:(f) {text}`のように`\item`コマンドの2番目
- `+listing ?:(f) {|\item{}|}`のように環境コマンドの1番目

に、デザインする関数をオプション引数の形で与えることでタイトルのデザインを変えることができます。

デザインする関数は`context -> int list -> inline-text -> inline-boxes`という型で、文脈・何番目かを表すリスト・タイトルの3つを受け取って`inline-boxes`を返すものになります。


さらに、タイトルと本文で改行するかどうかを選択することができます。

- `\item ?* ?* ?(true) {text}`のように`\item`コマンドの3番目
- `+listing ?* ?:(true) {|\item{}|}`のように環境コマンドの2番目

に、`bool`型を入れます。

デフォルトは、`listing`と`enumerate`では`false`で、`description`では`true`です。
