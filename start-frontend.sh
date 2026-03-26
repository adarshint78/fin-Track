#!/bin/bash
set -e

echo "🎨 Starting FinTrack Frontend..."
cd "$(dirname "$0")/frontend"

if [ ! -d "node_modules" ]; then
  echo "📦 Installing dependencies..."
  npm install
fi

echo "✅ Starting React app on http://localhost:5173"
npm run dev
