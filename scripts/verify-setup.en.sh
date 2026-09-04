#!/usr/bin/env bash
# ==============================================================================
# scripts/verify-setup.en.sh (English Version)
# Automated health check verification for Mac Dev & Vibe Coding environment
# ==============================================================================

echo "🔍 VERIFYING MAC DEV & VIBE CODING ENVIRONMENT..."
echo ""

check_tool() {
  local name="$1"
  local cmd="$2"
  if [ -z "$cmd" ]; then cmd="$name"; fi

  if command -v "$cmd" &> /dev/null; then
    local path
    path=$(which "$cmd")
    echo "  ✅ [OK] $name ($path)"
  else
    echo "  ❌ [MISSING] $name is not installed or not in PATH"
  fi
}

check_cask() {
  local name="$1"
  local app_path="$2"
  if [ -d "$app_path" ] || [ -d "$HOME/$app_path" ]; then
    echo "  ✅ [OK] $name (Installed)"
  else
    echo "  ⚠️ [NOT FOUND] $name ($app_path)"
  fi
}

echo "📦 1. Package Manager & CLI Core:"
check_tool "Homebrew" "brew"
check_tool "Starship Prompt" "starship"
check_tool "eza" "eza"
check_tool "bat" "bat"
check_tool "ripgrep" "rg"
check_tool "fzf" "fzf"
check_tool "zoxide" "zoxide"
check_tool "GitHub CLI" "gh"
check_tool "tldr" "tldr"
check_tool "jq" "jq"
check_tool "yq" "yq"
echo ""

echo "⚡ 2. Runtimes & Containers:"
check_tool "mise" "mise"
check_tool "bun" "bun"
check_tool "pnpm" "pnpm"
check_tool "uv" "uv"
check_tool "Docker CLI" "docker"
echo ""

echo "🤖 3. AI & Vibe Coding Tools:"
check_tool "claude-code" "claude"
check_tool "aider" "aider"
check_tool "ollama" "ollama"
check_cask "Cursor" "/Applications/Cursor.app"
check_cask "Zed" "/Applications/Zed.app"
check_cask "Claude Desktop" "/Applications/Claude.app"
check_cask "ChatGPT" "/Applications/ChatGPT.app"
check_cask "LM Studio" "/Applications/LM Studio.app"
echo ""

echo "🖥️ 4. Terminal & Productivity Suite:"
check_cask "Ghostty" "/Applications/Ghostty.app"
check_cask "OrbStack" "/Applications/OrbStack.app"
check_cask "Raycast" "/Applications/Raycast.app"
check_cask "Shottr" "/Applications/Shottr.app"
check_cask "Ice Menu Bar" "/Applications/Ice.app"
check_cask "BetterDisplay" "/Applications/BetterDisplay.app"
check_cask "Arc Browser" "/Applications/Arc.app"
echo ""

echo "🔑 5. Git & SSH Configuration:"
echo "  Git User Name:  $(git config user.name || echo 'Not configured')"
echo "  Git User Email: $(git config user.email || echo 'Not configured')"
echo "  Default Branch: $(git config init.defaultBranch || echo 'master')"
echo "  Commit Signing: $(git config commit.gpgsign || echo 'false')"
if [ -f "$HOME/.ssh/id_ed25519" ]; then
  echo "  ✅ SSH Key Ed25519: $HOME/.ssh/id_ed25519"
else
  echo "  ❌ $HOME/.ssh/id_ed25519 not found"
fi
echo ""

echo "🎉 VERIFICATION FINISHED!"
