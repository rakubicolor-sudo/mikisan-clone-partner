#!/usr/bin/env bash
# UTAGE REST API 接続テスト
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
ENV_FILE="${ROOT}/.env"

if [[ ! -f "${ENV_FILE}" ]]; then
  echo "ERROR: .env がありません。.env.example をコピーして APIキーを入れてください。"
  echo "  cp .env.example .env"
  exit 1
fi

# shellcheck disable=SC1090
set -a
source "${ENV_FILE}"
set +a

if [[ -z "${UTAGE_API_KEY:-}" || "${UTAGE_API_KEY}" == "YOUR_API_KEY_HERE" ]]; then
  echo "ERROR: UTAGE_API_KEY が未設定です。.env を編集してください。"
  exit 1
fi

BASE="${UTAGE_API_BASE:-https://api.utage-system.com/v1}"

echo "▶ GET ${BASE}/accounts"
HTTP_CODE=$(curl -sS -o /tmp/utage_api_test.json -w "%{http_code}" \
  -X GET "${BASE}/accounts" \
  -H "Authorization: Bearer ${UTAGE_API_KEY}" \
  -H "Content-Type: application/json" \
  --max-time 30)

echo "HTTP ${HTTP_CODE}"
python3 - <<'PY' 2>/dev/null || cat /tmp/utage_api_test.json
import json
from pathlib import Path
raw = Path("/tmp/utage_api_test.json").read_text(encoding="utf-8")
try:
    data = json.loads(raw)
    print(json.dumps(data, ensure_ascii=False, indent=2)[:4000])
except Exception:
    print(raw[:2000])
PY

if [[ "${HTTP_CODE}" == "200" ]]; then
  echo "✅ API接続成功"
  exit 0
fi

echo "❌ API接続失敗（HTTP ${HTTP_CODE}）"
exit 1
