# Bellwether Servicing Portal

Standalone desktop application for managing loan portfolios — billing statements, interest calculations, cash management, and reserve tracking. Built as a single-page HTML app wrapped in Electron for local installation, with a path to web hosting.

---

## Project Structure

```
bellwether-portal/
├── app.html          ← Portal UI, logic, and styles (single file)
├── main.js           ← Electron main process
├── package.json      ← Dependencies and build config
├── build.bat         ← Windows build script (runs electron-builder)
├── assets/
│   └── icon.ico      ← App icon (add your own)
└── dist/             ← Build output (gitignored)
```

---

## Local Development

### Prerequisites
- [Node.js 20+](https://nodejs.org/) on your PATH

### Run in dev mode
```bash
npm install       # first time only
npm start         # opens the app in an Electron window
```

---

## Build Installers (Windows)

Double-click `build.bat`, or from a terminal:

```bash
npm install           # first time only
npm run build         # produces NSIS installer + portable EXE in dist/
```

Output files in `dist/`:
| File | Description |
|---|---|
| `Bellwether Servicing Portal Setup 1.0.0.exe` | NSIS installer — installs like any app |
| `Bellwether Servicing Portal 1.0.0.exe` | Portable EXE — run without installing |

To build only one target:
```bash
npm run build:installer   # installer only
npm run build:portable    # portable only
```

---

## Web Hosting (future)

`app.html` is self-contained (no server required — all state uses `localStorage`). To host it:

1. **GitHub Pages** — push `app.html` to a `gh-pages` branch as `index.html`
2. **Netlify / Vercel** — drag-and-drop `app.html` renamed to `index.html`
3. **Any static host** — upload the single file

> Note: The live rate-fetch feature calls the Anthropic API directly from the browser. For production web hosting you'll want to proxy that through a small backend to keep the API key server-side.

---

## Updating the App

All portal logic lives in `app.html`. Edit that file to:
- Add or modify views
- Change CSS variables / theme
- Update calculation logic
- Adjust investment data structures

The Electron wrapper (`main.js`) only needs changes for native OS features (menus, auto-update, file dialogs, etc.).

---

## App Icon

Place a 256×256 `icon.ico` in the `assets/` folder before building. If the folder doesn't exist:

```bash
mkdir assets
```

Without an icon the build still works — Windows will use the default Electron icon.

---

## License

Proprietary — Bellwether Asset Management, Inc.
