#!/bin/bash
set -e

echo "🚀 Starting FinTrack Backend..."
cd "$(dirname "$0")/backend"

if [ ! -d "venv" ]; then
  echo "📦 Creating virtual environment..."
  python3 -m venv venv
fi

echo "⚙️  Activating venv and installing dependencies..."
source venv/bin/activate
pip install -r requirements.txt -q

echo "✅ Starting FastAPI on http://localhost:8000"
echo "📖 API docs: http://localhost:8000/docs"
uvicorn main:app --reload --port 8000
