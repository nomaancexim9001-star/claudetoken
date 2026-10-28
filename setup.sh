#!/usr/bin/env bash
# ==============================================================================
# Setup Script for Claude Desktop & OmniRoute Gateway
# Organization ID: ab582751-b90d-48cf-81a6-620979f5541a
# Repository: https://github.com/nomaancexim9001-star/claudetoken
# ==============================================================================

set -e

echo "==> Configuring Claude Desktop for OmniRoute Gateway..."

if [[ "$OSTYPE" == "darwin"* ]]; then
  CONFIG_DIR="$HOME/Library/Application Support/Claude"
elif [[ "$OSTYPE" == "linux"* ]]; then
  CONFIG_DIR="$HOME/.config/Claude"
else
  CONFIG_DIR="$APPDATA/Claude"
fi

mkdir -p "$CONFIG_DIR"

if [ -f "$CONFIG_DIR/claude_desktop_config.json" ]; then
  echo "==> Backing up existing config to claude_desktop_config.json.bak"
  cp "$CONFIG_DIR/claude_desktop_config.json" "$CONFIG_DIR/claude_desktop_config.json.bak"
fi

cp claude_desktop_config.json "$CONFIG_DIR/claude_desktop_config.json"

echo "✅ Installed configuration to $CONFIG_DIR/claude_desktop_config.json"
echo ""
echo "Gateway URL: http://localhost:20128"
echo "Gateway Key: sk-omniroute-local-token-9b"
echo "Organization ID: ab582751-b90d-48cf-81a6-620979f5541a"
echo ""
echo "Next: Launch Claude Desktop, verify Developer Mode, and open the Code tab!"
