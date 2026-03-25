// ════════════════════════════════════════════════════════════
//  ODD Agency — Illumina
//  Configurazione Firebase Realtime Database
//
//  ISTRUZIONI (5 minuti):
//  1. Vai su https://console.firebase.google.com
//  2. Clicca "Crea un progetto" → dai un nome (es. "odd-illumina")
//  3. Disabilita Google Analytics (non serve) → Crea progetto
//  4. Nella home del progetto: clicca l'icona </> (Web)
//  5. Registra l'app → copia il blocco firebaseConfig
//  6. Incolla i valori qui sotto
//  7. Nel menu laterale: Build → Realtime Database → Crea database
//     Scegli posizione (europe-west1 consigliato) → avvia in modalità test
//  8. Pronto!
// ════════════════════════════════════════════════════════════

window.FIREBASE_CONFIG = {
    apiKey: "AIzaSyBS0DdD65vS_EXUuHuWJfw3rhZcXbuBxEw",
    authDomain: "odd-creativityreveal.firebaseapp.com",
    databaseURL: "https://odd-creativityreveal-default-rtdb.europe-west1.firebasedatabase.app",
    projectId: "odd-creativityreveal",
    storageBucket: "odd-creativityreveal.firebasestorage.app",
    messagingSenderId: "47918146771",
    appId: "1:47918146771:web:1e1f4f0187f3ad7fa12026"
  };
  
// NOTA: il piano free di Firebase (Spark) supporta:
// - 100 connessioni simultanee
// - 1 GB di storage
// - 10 GB di download/mese
// Più che sufficiente per questo utilizzo.
