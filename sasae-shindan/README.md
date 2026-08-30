# 支え方のすれ違い診断 公開メモ

このフォルダには、LINE登録特典用の診断ページ（HTML）が入っています。

## 公式URL（導線の順番）

1. **まず LINE登録（UTAGE）** ← Instagramプロフィール・投稿CTAはここ

```text
https://utage2525.sinajiku.com/line/open/8eAs8859RBpH
```

2. **支え方のすれ違い診断（登録特典）** ← LINE登録後に案内

```text
https://rakubicolor-sudo.github.io/mikisan-clone-partner/
```

## ファイル

- `index.html` : 診断ページ本体（12問・4タイプ自動判定）

## 診断仕様

| 項目 | 内容 |
|---|---|
| タイトル | あなたの善意、ちゃんと届いてる？ |
| 形式 | 12問 × 4択 |
| タイプ | 先回り／正解を渡す／心配／信じて引き出す |
| 判定 | 最多得点のタイプ（同点時は複数タイプを案内） |

## 使い方（HTML版を使う場合）

1. `index.html` をWeb上に公開する
2. 公開後のURLを、UTAGEの友だち追加メッセージのボタンに設定する
3. Instagramからの入口は必ず UTAGE の LINE登録 URL を使う

## LINE URLの差し替え

結果画面のボタン先は、`index.html` 内の以下を変更してください。

```javascript
const config = {
  lineUrl: "https://utage2525.sinajiku.com/line/open/8eAs8859RBpH"
};
```

※ すでに友だち追加済みの方が診断する場合、CTAは「LINEに戻って返信」が主目的です。必要に応じて公式LINEのトークURLに差し替えてください。

## 公開後にURLパラメータで上書きする方法

公開URLの末尾に `?line=` を付けると、ボタン先を一時的に上書きできます。

例:

```text
https://example.com/sasae-shindan/?line=https%3A%2F%2Futage2525.sinajiku.com%2Fline%2Fopen%2F8eAs8859RBpH
```

## ローカルで確認

```bash
open /Users/kawanishimiraishi/Desktop/mikisan-clone-partner/sasae-shindan/index.html
```

## UTAGEに入れる前の確認ポイント

- スマホで1問ずつ表示されるか
- 4択が読みやすいか
- 結果画面まで問題なく進めるか
- 4タイプすべての結果文がブランドに合っているか
- LINE誘導ボタンのリンク先が正しいか

## 差し替え対象（旧診断）

- 旧：コミュ力診断（`commu-shindan/`）
- 新：支え方のすれ違い診断（このフォルダ）

ウェルカム文・プロフィール・Instagram固定投稿の診断名も、公開URL確定後に一括更新してください。
