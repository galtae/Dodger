
If CheckIsGameRunning() Then
   DoDodge()
   sleep(500)

EndIf

RunGame()
LogIn()

Func RunGame()
   run("C:\Riot Games\League of Legends\lol.launcher.exe") ; your lol path
   WinWait("[CLASS:Chrome_WidgetWin_0]")

   sleep(7000)
   send("{Tab}")
   send("{Space}")

EndFunc
0
Func LogIn()
   WinWaitActive("PVP.Net 클라이언트") ; your launcher caption
   sleep(2500)
   send("+{Tab}")
   sleep(1000)
   Send("{CTRLDOWN}c{CTRLUP}")
   Local $Id = ClipGet()
   Local $ToId;
   Local $ToPass;


;your account
   If $Id == "ID1" Then 
	  $ToId = "ID2"
	  $ToPass = "password1"

   ElseIf $Id == "ID2" Then
	  $ToId = "ID1"
	  $ToPass = "password2"

   endIf

   send($ToId)
   send("{Tab}")
   send($ToPass)

   send("{Tab}")
   send("{Tab}")
   send("{Space}")
EndFunc

Func DoDodge()

Local $iInt = Random(0,5,1)
Local $sMsg = ""
Switch $iInt
Case 0
   ; Dodge Ment
   $sMsg = "더 강해져서 돌아오겠다!"
Case 1
   $sMsg = "그 누구도 닷지하지 않노"
Case 2
   $sMsg = "I will be back"
Case 3
   $sMsg = "닷지를 시전한다."
Case 4
   $sMsg = "내가 닷지해서 얼마나 행복한지 지켜보겠다"
case Else
  $sMsg = ""
EndSwitch

WinSetOnTop("PVP.Net 클라이언트","", 0)
WinSetOnTop("PVP.Net 클라이언트","", 1)
WinSetState("PVP.Net 클라이언트", "", @SW_SHOW )
sleep(1000)
MouseClick("left", 713, 878)
send($sMsg)
send("{Enter}")
sleep(2000)

WinKill("PVP.Net 클라이언트")
EndFunc

Func CheckIsGameRunning()
   If WinExists("PVP.Net 클라이언트") Then
	  return true
   Else
	  return false
   EndIf

EndFunc

 Func _DebugPrint($msg)
    Local $out = $msg
    DllCall("kernel32.dll", "none", "OutputDebugString", "str", $out)
EndFunc 

