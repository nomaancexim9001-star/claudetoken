# Claude Token Bridge & Free Model Gateway 🚀

Repository: [nomaancexim9001-star/claudetoken](https://github.com/nomaancexim9001-star/claudetoken)  
Target Claude Organization ID: `ab582751-b90d-48cf-81a6-620979f5541a`  
Configured Gateway: **OmniRoute** (`http://localhost:20128`)

---

## 📖 Overview

This repository equips your **Claude Desktop** and **Claude Code CLI** to connect through a local AI Gateway (**OmniRoute**) with **0-cost inference** using free tier providers (such as Google Gemini 2.0 Flash, Groq LPU, and OpenRouter Free models).

By routing queries through the local gateway, Claude Desktop can tap into virtually unlimited tokens (~9 Billion tokens across multi-provider free tiers) without exhausting Anthropic paid quota.

---

## 🏛 Architecture

```
┌────────────────────────────────────────────────────────┐
│ Claude Desktop (Code Tab) / Claude Code CLI            │
│ Organization ID: ab582751-b90d-48cf-81a6-620979f5541a │
└──────────────────────────┬─────────────────────────────┘
                           │ (Bearer Token: sk-omniroute-local-token-9b)
                           ▼
┌────────────────────────────────────────────────────────┐
│ Local AI Gateway: OmniRoute (http://localhost:20128)      │
│ Translates Anthropic Messages API -> OpenAI/Gemini     │
└───────────────┬────────────────────────┬───────────────┘
                │                        │
       ┌────────▼────────┐      ┌────────▼────────┐
       │ Google Gemini   │      │ Groq LPU Cloud  │
       │ 2.0 Flash (Free)│      │ Llama 3.3 (Free)│
       └─────────────────┘      └─────────────────┘
```

---

## ⚡ Quick Start (3 Steps)

### Step 1: Run the Local Gateway

#### Option A: Native Desktop App
1. Download OmniRoute from [https://github.com/cheaper-inference/OmniRoute/releases](https://github.com/cheaper-inference/OmniRoute/releases).
2. Install and launch it.
3. Open the dashboard at `http://localhost:20128`.
4. In **Providers**, add your free API key (e.g. [Google AI Studio](https://aistudio.google.com/app/apikey) or [Groq](https://console.groq.com/keys)).
5. In **Endpoints**, ensure the local key matches `sk-omniroute-local-token-9b`.

#### Option B: Docker 1-Liner
```bash
docker compose up -d
```

---

### Step 2: Configure Claude Desktop

1. Open **Claude Desktop**.
2. Enable Developer Mode:
   - **Windows**: Click `☰` (top-left) → **Help** → **Troubleshooting** → **Enable Developer Mode**.
   - **macOS**: Menu bar → **Help** → **Troubleshooting** → **Enable Developer Mode**.
   - Claude will relaunch.
3. Open **Developer** → **Configure Third-Party Inference...**:
   - **Inference provider**: `Gateway`
   - **Gateway base URL**: `http://localhost:20128` *(Important: DO NOT append /v1)*
   - **Credential kind**: `Static API key`
   - **Gateway auth scheme**: `Bearer`
   - **Gateway API key**: `sk-omniroute-local-token-9b`
4. Click **Test Connection**, then **Apply Changes**.

*Alternatively, run the automated setup script included in this repository:*
- On Windows PowerShell: `powershell -ExecutionPolicy Bypass -File .\setup.ps1`
- On macOS / Linux: `chmod +x setup.sh && ./setup.sh`

---

### Step 3: Connect this Repository & Open Code Tab

1. Clone or pull this repository:
   ```bash
   git clone https://github.com/nomaancexim9001-star/claudetoken.git
   cd claudetoken
   ```
2. In **Claude Desktop**, switch to the **Code** tab.
3. Click **Select Project Folder** and choose the `claudetoken` directory.
4. Prompt Claude:
   > *"Explain this project and verify our token bridge configuration."*
5. Check your OmniRoute dashboard to view the incoming request served 100% free!

---

## 🛠 File Manifest

| File | Purpose |
|------|---------|
| `claude_desktop_config.json` | Pre-configured Claude Desktop configuration with Gateway & Org ID |
| `.claude.json` | Claude Code CLI repository configuration |
| `docker-compose.yml` | Instant containerized OmniRoute deployment |
| `setup.sh` | One-click configuration script for macOS / Linux |
| `setup.ps1` | One-click configuration script for Windows |
| `.env.example` | Free provider API key templates (keep secrets safe) |
| `gateway-routes.json` | Routing rules mapping Claude models to Gemini/Llama |

---

## 🔧 Troubleshooting

- **"Gateway was unreachable"**: Confirm OmniRoute is active at `http://localhost:20128`. Check that you did NOT type `/v1` at the end of the URL.
- **Developer menu not visible**: Ensure you clicked **Help → Troubleshooting → Enable Developer Mode** and allowed Claude to restart.
- **Port already in use**: If port `20128` is occupied, change the port in `docker-compose.yml` and update `claude_desktop_config.json`.

---
*Created for Organization ID: `ab582751-b90d-48cf-81a6-620979f5541a` · Repository: [claudetoken](https://github.com/nomaancexim9001-star/claudetoken)*
