# ODD — Illumina · Guida operatore

Applicativo web collaborativo: un video nascosto dal nero, rivelato
dai partecipanti tenendo il dito sullo schermo del telefono.

---

## Setup iniziale (una volta sola)

### 1. Crea il progetto Firebase

1. Vai su **https://console.firebase.google.com**
2. **Crea un progetto** → nome es. `odd-illumina` → disabilita Analytics → Crea
3. Nella home del progetto clicca l'icona **</>** (Web app)
4. Registra l'app → copia il blocco `firebaseConfig`
5. Nel menu laterale: **Build → Realtime Database → Crea database**
   - Regione: `europe-west1`
   - Avvia in **modalità test** (regole aperte, ok per uso interno)
6. Apri `firebase-config.js` e incolla i valori:

```js
window.FIREBASE_CONFIG = {
  apiKey:            "la-tua-api-key",
  authDomain:        "odd-illumina.firebaseapp.com",
  databaseURL:       "https://odd-illumina-default-rtdb.europe-west1.firebasedatabase.app",
  projectId:         "odd-illumina",
  ...
};
```

### 2. Carica su Aruba (o GitHub Pages)

**Aruba:** carica via FTP la cartella `video_app/` in una sottocartella del dominio.
Il video (`CattedraleFull_VMF26.mp4`) è 3.2 GB — assicurati che la cartella abbia spazio sufficiente.
Verifica che il server supporti **range requests** (quasi tutti i server Apache/Nginx le supportano).

**GitHub Pages:**
```bash
# Nella cartella video_app:
git init
git add .
git commit -m "ODD Illumina"
git branch -M main
git remote add origin https://github.com/TUO_ACCOUNT/odd-illumina.git
git push -u origin main
# Vai su Settings → Pages → Source: main branch
```
Nota: GitHub Pages ha limite 100MB per file. Per il video usare **Git LFS** o hostarla separatamente
e aggiornare il percorso `<source src="...">` in `index.html`.

---

## Avvio in locale (test/evento LAN)

```
doppio click su start.bat
```

App disponibile su `http://localhost:8080`
Da telefono nella stessa rete WiFi: `http://IP_DEL_PC:8080`

---

## Come si usa

### Modalità player (default)
Apri l'URL dal telefono.
- **Crea stanza** → genera un codice di 4 lettere, condividilo
- **Entra** → inserisci il codice ricevuto
- Tocca lo schermo e tienilo premuto → appare il tuo spotlight
- Più persone entrano nella stessa stanza, più del video si rivela

### Modalità schermo fisso
Aggiunge `?mode=screen&room=CODICE` all'URL:
```
https://tuo-dominio.it/?mode=screen&room=ABCD
```
Lo schermo fisso:
- Mostra il video con tutti gli spotlight
- Video è muto (l'audio esce dai telefoni)
- Visualizza QR code per far entrare i partecipanti
- Non aggiunge un player proprio

### Condivisione link diretto
Con il codice stanza nell'URL, i partecipanti entrano direttamente:
```
https://tuo-dominio.it/?room=ABCD
```

---

## Parametri modificabili (in index.html)

| Costante | Default | Significato |
|----------|---------|-------------|
| `RADIUS_FRACTION` | `0.18` | Dimensione spotlight (frazione schermo) |
| `SOFTNESS_STOP` | `0.65` | Morbidezza bordo (0=netto, 1=tutto sfumato) |
| `WRITE_THROTTLE_MS` | `80` | Frequenza aggiornamenti Firebase (ms) |
| `PLAYER_TIMEOUT_MS` | `2500` | Timeout inattività player (ms) |

Per aumentare il numero di player necessari a scoprire tutto il video,
abbassa `RADIUS_FRACTION` (es. `0.12` → servono ~15 player).

---

## Struttura file

```
video_app/
├── index.html          ← app intera (HTML/CSS/JS)
├── firebase-config.js  ← credenziali Firebase (già compilato)
├── start.bat           ← avvia server locale (Windows)
├── stop.bat            ← ferma server locale
├── start.sh            ← avvia server locale (Linux/macOS)
└── README-OPERATORE.md ← questo file
```

> **Nota video**: il video è caricato da YouTube (`youtu.be/a-4kuzLgOGo`)
> tramite YouTube IFrame API — nessun file MP4 locale necessario.

---

## Note tecniche

- **Sync video**: al primo player si registra il timestamp di partenza in Firebase.
  Chi si unisce dopo calcola `elapsed = (now - startTs) / 1000` e salta al punto corretto.
  Con video in loop: `currentTime = elapsed % duration`.

- **Spotlight**: canvas HTML5 con `destination-out` — il nero viene "bucato" nei punti
  di contatto, rivelando il video sotto. Più efficienti di WebGL per questo caso.

- **Firebase free tier (Spark)**: 100 connessioni simultanee, 1GB storage, 10GB/mese download.
  Sufficiente per eventi fino a ~80-100 persone.

- **Video YouTube**: il player è incorporato via YouTube IFrame API con
  `controls:0`, `loop:1`, `playsinline:1`. Per cambiare video basta aggiornare
  il `videoId` in `index.html` (cercare `a-4kuzLgOGo`).
