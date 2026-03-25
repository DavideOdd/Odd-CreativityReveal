@echo off
REM ── ODD Agency — Illumina ──────────────────────────────────
REM Ferma il server HTTP locale

echo Fermo il server HTTP (Python)...
taskkill /F /IM python.exe /T >nul 2>&1
taskkill /F /IM python3.exe /T >nul 2>&1
echo Fatto.
timeout /t 1 >nul
