#!/usr/bin/env bash
set -euo pipefail

cd /opt/Monarque-dark-ia
echo "[Monarque] pulling latest code..."
git pull

echo "[Monarque] rebuilding containers..."
docker compose up -d --build

echo "[Monarque] running migrations..."
docker compose exec -T server npm run db:migrate

echo "[Monarque] update complete."