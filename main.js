const { app, BrowserWindow, shell } = require('electron');
const path = require('path');

// Keep a global reference so the window isn't GC'd
let mainWindow = null;

function createWindow() {
  mainWindow = new BrowserWindow({
    width: 1440,
    height: 900,
    minWidth: 900,
    minHeight: 600,
    title: 'Bellwether Servicing Portal',
    webPreferences: {
      nodeIntegration: false,
      contextIsolation: true,
      sandbox: true,
      webSecurity: true,
    },
    backgroundColor: '#07080b',
    show: false, // show after 'ready-to-show' to avoid flash
  });

  mainWindow.loadFile('app.html');

  // Show window once content is painted (no white flash)
  mainWindow.once('ready-to-show', () => {
    mainWindow.show();
  });

  // Open external links in the system browser, not in the app
  mainWindow.webContents.setWindowOpenHandler(({ url }) => {
    shell.openExternal(url);
    return { action: 'deny' };
  });

  mainWindow.on('closed', () => {
    mainWindow = null;
  });
}

app.whenReady().then(createWindow);

app.on('window-all-closed', () => {
  app.quit();
});

app.on('activate', () => {
  if (BrowserWindow.getAllWindows().length === 0) createWindow();
});
