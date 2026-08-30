# コミュ力診断 公開メモ

このフォルダには、自動計算版の診断ページ（HTML）が入っています。

## 公式URL（導線の順番）

1. **まず LINE登録（UTAGE）** ← Instagramプロフィール・投稿CTAはここ

```text
https://utage2525.sinajiku.com/line/open/8eAs8859RBpH
```

2. **コミュ力診断（登録特典）** ← LINE登録後に案内

```text
https://canva.link/s0mib75h8c0xsz3
```

このフォルダの `index.html` は補助・下書き用です。

## ファイル

- `index.html` : 診断ページ本体（自動計算版）

## 使い方（HTML版を使う場合）

1. `index.html` をWeb上に公開する
2. 公開後のURLを、必要ならLINE登録後の導線に設定する
3. Instagramからの入口は必ず UTAGE の LINE登録 URL を使う

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
