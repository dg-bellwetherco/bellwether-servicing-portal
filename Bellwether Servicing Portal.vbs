Set objShell = CreateObject("WScript.Shell")
strPath = objShell.CurrentDirectory
objShell.Run """" & strPath & "\electron.exe"" .", 0, False
