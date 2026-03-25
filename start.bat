@echo off
REM ── ODD Agency — Illumina ──────────────────────────────────
REM Avvia server HTTP locale per test in LAN
REM Accessibile da: http://localhost:8080  oppure http://IP_PC:8080

echo.
echo  ODD Agency ^| Illumina
echo  ─────────────────────────────────────────────
echo  Server avviato su http://localhost:8080
echo  Per testare da telefono usa l'IP della rete LAN
echo  (Impostazioni ^> WiFi ^> vedi indirizzo IP)
echo  ─────────────────────────────────────────────
echo  Premi CTRL+C per fermare
echo.

REM Trova Python (prova sia python che python3)
where python >nul 2>&1
if %ERRORLEVEL% == 0 (
  python -m http.server 8080
) else (
  where python3 >nul 2>&1
  if %ERRORLEVEL% == 0 (
    python3 -m http.server 8080
  ) else (
    echo ERRORE: Python non trovato. Installalo da https://python.org
    pause
  )
)
