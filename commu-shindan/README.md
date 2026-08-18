# コミュ力診断 公開メモ

このフォルダには、UTAGEのLINE登録特典として使える診断ページが入っています。

## ファイル

- `index.html` : 診断ページ本体

## 使い方

1. `index.html` をWeb上に公開する
2. 公開後のURLをUTAGEのリッチメニューに設定する

## LINE URLの差し替え

結果画面のボタン先は、`index.html` 内の以下を変更してください。

```html
const config = {
  lineUrl: "https://lin.ee/XXXXXX"
};
```

## 公開後にURLパラメータで上書きする方法

公開URLの末尾に `?line=` を付けると、ボタン先を一時的に上書きできます。

例:

```text
https://example.com/commu-shindan/?line=https%3A%2F%2Flin.ee%2Fabc123
```

## UTAGEに入れる前の確認ポイント

- スマホで1問ずつ表示されるか
- 結果画面まで問題なく進めるか
- LINE誘導ボタンのリンク先が正しいか
- デザインや文言がブランドに合っているか
