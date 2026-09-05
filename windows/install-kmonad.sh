#!/usr/bin/env bash
# Run from WSL. Downloads the latest kmonad.exe release and installs it into
# the Windows user's home ~/bin (i.e. %USERPROFILE%\bin), creating the dir if needed.
set -euo pipefail

if ! command -v wslpath >/dev/null 2>&1; then
  echo "error: wslpath not found — this script must run inside WSL" >&2
  exit 1
fi

win_home_raw=$(cmd.exe /c "echo %USERPROFILE%" 2>/dev/null | tr -d '\r\n')
win_home=$(wslpath -u "$win_home_raw")
bin_dir="$win_home/bin"

mkdir -p "$bin_dir"

api_url="https://api.github.com/repos/kmonad/kmonad/releases/latest"
download_url=$(curl -fsSL "$api_url" | grep -o '"browser_download_url": *"[^"]*kmonad\.exe"' | sed -E 's/.*"(https[^"]+)"/\1/')

if [[ -z "$download_url" ]]; then
  echo "error: could not find kmonad.exe in the latest release" >&2
  exit 1
fi

echo "installing $download_url -> $bin_dir/kmonad.exe"
curl -fsSL "$download_url" -o "$bin_dir/kmonad.exe"
chmod +x "$bin_dir/kmonad.exe"

echo "done: $bin_dir/kmonad.exe"
