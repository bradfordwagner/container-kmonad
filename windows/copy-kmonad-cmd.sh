#!/usr/bin/env bash
# Run from WSL. Copies the kmonad launch command to the Windows clipboard so it can be
# pasted straight into an (elevated) PowerShell prompt — no .ps1 script execution needed.
set -euo pipefail

if ! command -v wslpath >/dev/null 2>&1; then
  echo "error: wslpath not found — this script must run inside WSL" >&2
  exit 1
fi

win_home_raw=$(cmd.exe /c "echo %USERPROFILE%" 2>/dev/null | tr -d '\r\n')
kmonad_exe="${win_home_raw}\\bin\\kmonad.exe"
config_path=$(wslpath -w ~/dotfiles/dots/config/kmonad/windows_v1.kbd)

cmd="& \"${kmonad_exe}\" \"${config_path}\""

printf '%s' "$cmd" | clip.exe

echo "copied to clipboard:"
echo "  $cmd"
echo "paste into an elevated PowerShell prompt to run it (kmonad needs admin rights for its low-level-hook)"
