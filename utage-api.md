# UTAGE API接続

公式: https://docs.utage-system.com/authentication  
ベースURL: `https://api.utage-system.com/v1`

## 1. APIキーを発行

1. UTAGE管理画面にログイン  
2. 右上メニュー **API設定**  
3. **追加する** → 管理名称を入力 → 保存  
4. 表示されたキーをコピー（**一度だけ表示**）

## 2. このプロジェクトにキーを入れる

```bash
cp .env.example .env
```

`.env` を開き、`YOUR_API_KEY_HERE` を本物のキーに置き換える。

```bash
UTAGE_API_KEY=（ここに貼る）
UTAGE_API_BASE=https://api.utage-system.com/v1
```

※ `.env` は `.gitignore` 済み。Gitに上げない。

## 3. 接続テスト

```bash
chmod +x scripts/utage-api-test.sh
./scripts/utage-api-test.sh
```

成功すると配信アカウント一覧が返り、`✅ API接続成功` と出ます。

## 4. 手動curl例

```bash
source .env
curl -X GET "${UTAGE_API_BASE}/accounts" \
  -H "Authorization: Bearer ${UTAGE_API_KEY}" \
  -H "Content-Type: application/json"
```

## MCPとの違い

| 方式 | 認証 | 用途 |
|---|---|---|
| **REST API**（このファイル） | APIキー（Bearer） | スクリプト・自動化 |
| **MCP**（`.cursor/mcp.json`） | OAuthログイン | Cursorから対話操作 |

両方併用可。LINEリマインダ操作はAPI／MCPのどちらかで可能（機能により管理画面が必要な場合あり）。
