# 💰 FinTrack — Full Stack Finance Tracker

A production-ready personal finance tracker built with **React**, **FastAPI**, and **SQLite**.

---

## 📁 Project Structure

```
finance-tracker/
├── backend/                  # FastAPI backend
│   ├── main.py               # App entry point + CORS
│   ├── requirements.txt      # Python dependencies
│   ├── database/
│   │   └── db.py             # SQLite engine + session
│   ├── models/
│   │   └── models.py         # SQLAlchemy ORM models
│   ├── schemas/
│   │   └── schemas.py        # Pydantic request/response schemas
│   └── routers/
│       ├── transactions.py   # CRUD for transactions
│       ├── categories.py     # CRUD + auto-seed categories
│       ├── budgets.py        # Budget goals + alert logic
│       ├── dashboard.py      # Analytics aggregations
│       └── recurring.py      # Recurring transaction engine
│
└── frontend/                 # React + Vite frontend
    ├── index.html
    ├── vite.config.js        # Proxy /api → localhost:8000
    ├── package.json
    └── src/
        ├── App.jsx           # Router + Toaster
        ├── main.jsx          # React entry
        ├── index.css         # Full design system (dark theme)
        ├── services/
        │   └── api.js        # Axios API calls
        ├── store/
        │   └── useStore.js   # Zustand global state
        ├── hooks/
        │   └── useFormat.js  # Currency + date formatters
        ├── components/
        │   ├── layout/
        │   │   └── Sidebar.jsx
        │   ├── charts/
        │   │   └── Charts.jsx   # Recharts: Bar, Area, Donut
        │   └── ui/
        │       ├── TransactionModal.jsx
        │       ├── BudgetModal.jsx
        │       └── RecurringModal.jsx
        └── pages/
            ├── Dashboard.jsx    # Analytics + alerts
            ├── Transactions.jsx # Full CRUD table
            ├── Budgets.jsx      # Budget goals + progress
            └── Recurring.jsx    # Recurring transactions
```

---

## ✨ Features

- **Dashboard** — 6-month income/expense bar chart, net savings trend line, category donut, recent transactions, budget alerts
- **Transactions** — Full CRUD with filters by type, category, month/year and real-time search
- **Budgets** — Set monthly category limits, visual progress bars, configurable alert thresholds (warns at X%)
- **Recurring** — Create daily/weekly/monthly/yearly transactions, pause/activate, manual trigger

---

## 🚀 Quick Start

### Prerequisites
- Python 3.10+
- Node.js 18+

---

### 1. Backend Setup

```bash
cd finance-tracker/backend

# Create virtual environment
python -m venv venv

# Activate (Linux/Mac)
source venv/bin/activate

# Activate (Windows)
venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Start the API server
uvicorn main:app --reload --port 8000
```

Backend runs at: **http://localhost:8000**  
API docs at: **http://localhost:8000/docs**

---

### 2. Frontend Setup

```bash
cd finance-tracker/frontend

# Install dependencies
npm install

# Start dev server
npm run dev
```

Frontend runs at: **http://localhost:5173**

---

## 🗄 Database

SQLite database file (`finance_tracker.db`) is created automatically in the `backend/` directory on first run.

**15 default categories** are seeded on first API call (Food & Dining, Transport, Shopping, Salary, etc.)

---

## 🔌 API Endpoints

| Method | Path | Description |
|--------|------|-------------|
| GET | `/api/dashboard/summary` | Full analytics summary |
| GET/POST | `/api/transactions/` | List / create transactions |
| PUT/DELETE | `/api/transactions/{id}` | Update / delete |
| GET/POST | `/api/budgets/` | List budgets with spending |
| PUT/DELETE | `/api/budgets/{id}` | Update / delete |
| GET/POST | `/api/categories/` | List / create categories |
| GET/POST | `/api/recurring/` | List / create recurring |
| POST | `/api/recurring/{id}/process` | Manually trigger recurring |

---

## 🎨 Design System

- **Dark theme** with CSS variables throughout
- **Fonts**: Syne (display) + DM Sans (body)
- **Colors**: Emerald green income, coral red expense, amber gold net
- **Responsive** — works on mobile and desktop

---

## 🔧 Production Build

```bash
# Build frontend
cd frontend
npm run build

# Serve backend with production server
cd backend
pip install gunicorn
gunicorn main:app -w 4 -k uvicorn.workers.UvicornWorker
```
