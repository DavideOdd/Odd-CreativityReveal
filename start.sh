#!/bin/bash
# ── ODD Agency — Illumina ─────────────────────────────────────
# Avvia server HTTP locale (Linux/macOS/Raspberry Pi)

echo ""
echo " ODD Agency | Illumina"
echo " ─────────────────────────────────────────────"
echo " Server avviato su http://localhost:8080"
echo " Per fermare: CTRL+C"
echo " ─────────────────────────────────────────────"
echo ""

python3 -m http.server 8080
