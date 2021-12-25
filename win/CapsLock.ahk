;=====================================================================o
;                   Feng Ruohang's AHK Script                         | 
;                      CapsLock Enhancement                           |
;---------------------------------------------------------------------o
;Description:                                                         |
;    This Script is wrote by Feng Ruohang via AutoHotKey Script. It   |
; Provieds an enhancement towards the "Useless Key" CapsLock, and     |
; turns CapsLock into an useful function Key just like Ctrl and Alt   |
; by combining CapsLock with almost all other keys in the keyboard.   |
;                                                                     |
;Summary:                                                             |
;o----------------------o---------------------------------------------o
;|CapsLock;             | {ESC}  Especially Convient for vim user     |
;|CaspLock + `          | {CapsLock}CapsLock Switcher as a Substituent|
;|CapsLock + hjklwb     | Vim-Style Cursor Mover                      |
;|CaspLock + uiop       | Convient Home/End PageUp/PageDn             |
;|CaspLock + nm,.       | Convient Delete Controller                  |
;|CapsLock + zxcvay     | Windows-Style Editor                        |
;|CapsLock + Direction  | Mouse Move                                  |
;|CapsLock + Enter      | Mouse Click                                 |
;|CaspLock + {F1}~{F6}  | Media Volume Controller                     |
;|CapsLock + qs         | Windows & Tags Control                      |
;|CapsLock + ;'[]       | Convient Key Mapping                        |
;|CaspLock + dfert      | Frequently Used Programs (Self Defined)     |
;|CaspLock + 123456     | Dev-Hotkey for Visual Studio (Self Defined) |
;|CapsLock + 67890-=    | Shifter as Shift                            |
;-----------------------o---------------------------------------------o
;|Use it whatever and wherever you like. Hope it help                 |
;=====================================================================o

;=====================================================================o
;                       Clipboard Functions                          ;|
;---------------------------------------------------------------------o
Copy(clipboardID)
{
	global ; All variables are global by default
	local oldClipboard := ClipboardAll ; Save the (real) clipboard
	
	Clipboard = ; Erase the clipboard first, or else ClipWait does nothing
	Send ^c
	ClipWait, 2, 1 ; Wait 1s until the clipboard contains any kind of data
	if ErrorLevel 
	{
		Clipboard := oldClipboard ; Restore old (real) clipboard
		return
	}
	
	ClipboardData%clipboardID% := ClipboardAll
	
	Clipboard := oldClipboard ; Restore old (real) clipboard
}

Cut(clipboardID)
{
	global ; All variables are global by default
	local oldClipboard := ClipboardAll ; Save the (real) clipboard
	
	Clipboard = ; Erase the clipboard first, or else ClipWait does nothing
	Send ^x
	ClipWait, 2, 1 ; Wait 1s until the clipboard contains any kind of data
	if ErrorLevel 
	{
		Clipboard := oldClipboard ; Restore old (real) clipboard
		return
	}
	ClipboardData%clipboardID% := ClipboardAll
	
	Clipboard := oldClipboard ; Restore old (real) clipboard
}

Paste(clipboardID)
{
	global
	local oldClipboard := ClipboardAll ; Save the (real) clipboard

	Clipboard := ClipboardData%clipboardID%
	Send ^v

	Clipboard := oldClipboard ; Restore old (real) clipboard
	oldClipboard = 
}
;---------------------------------------------------------------------o


;=====================================================================o
;                       CapsLock Initializer                         ;|
;---------------------------------------------------------------------o
SetCapsLockState, AlwaysOff                                          ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                       CapsLock Switcher:                           ;|
;---------------------------------o-----------------------------------o
;                    CapsLock + Esc | {CapsLock}                       ;|
;---------------------------------o-----------------------------------o
CapsLock & Esc::                                                     ;|
GetKeyState, CapsLockState, CapsLock, T                              ;|
if CapsLockState = D                                                 ;|
    SetCapsLockState, AlwaysOff                                      ;|
else                                                                 ;|
    SetCapsLockState, AlwaysOn                                       ;|
KeyWait, ``                                                          ;|
return                                                               ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                         CapsLock Escaper:                          ;|
;----------------------------------o----------------------------------o
;                        CapsLock  |  {ESC}                          ;|
;----------------------------------o----------------------------------o
CapsLock::Send, {ESC}                                                ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                    CapsLock Direction Navigator                    ;|
;-----------------------------------o---------------------------------o
;                      CapsLock + h |  Left                          ;|
;                      CapsLock + j |  Down                          ;|
;                      CapsLock + k |  Up                            ;|
;                      CapsLock + l |  Right                         ;|
;                      +Ctrl        |  Selection                   ;|
;                      +Shift       |  Switch tabs                  ;|
;                      +Alt Compatible                   ;|
;-----------------------------------o---------------------------------o
CapsLock & h::                                                       
if GetKeyState("control") = 1                                        
    Send, +{Left}
else if GetKeyState("shift") = 1                                        
    Send, ^+{Tab}
else Send, {Left} 
return
;-----------------------------------o                                
CapsLock & j:: 
if GetKeyState("control") = 1                                        
    Send, +{Down}
else if GetKeyState("alt") = 1                                        
    Send, !{Down}
else
    Send, {Down}
return
;-----------------------------------o                                
CapsLock & k::                                                       
if GetKeyState("control") = 1                                        
    Send, +{Up}
else if GetKeyState("alt") = 1                                        
    Send, !{Up}
else Send, {Up} 
return
;-----------------------------------o                                
CapsLock & l::                                                       
if GetKeyState("control") = 1                                        
    Send, +{Right}
else if GetKeyState("shift") = 1                                        
    Send, ^{Tab}
else Send, {Right} 
return
;---------------------------------------------------------------------o


;=====================================================================o
;                     CapsLock Home/End Navigator                    ;|
;-----------------------------------o---------------------------------o
;                      CapsLock + i |  Home                          ;|
;                      CapsLock + o |  End                           ;|
;                      +Ctrl for Selection                          ;|
;-----------------------------------o---------------------------------o
CapsLock & i::
if GetKeyState("control") = 1                                        
    Send, +{Home}
else Send, {Home} 
return
;-----------------------------------o                                ;|
CapsLock & o::
if GetKeyState("control") = 1                                        
    Send, +{End}
else Send, {End} 
return
;---------------------------------------------------------------------o


;=====================================================================o
;                      CapsLock Page Navigator                       ;|
;-----------------------------------o---------------------------------o
;                      CapsLock + u |  PageUp                        ;|
;                      CapsLock + p |  PageDown                      ;|
;                      Ctrl, Alt Compatible                          ;|
;-----------------------------------o---------------------------------o
CapsLock & u::                                                       ;|
if GetKeyState("control") = 1                                        
    Send, +{PgUp}
else Send, {PgUp} 
return
;-----------------------------------o                                ;|
CapsLock & p::                                                       ;|
if GetKeyState("control") = 1                                        
    Send, +{PgDn}
else Send, {PgDn} 
return
;---------------------------------------------------------------------o


;=====================================================================o
;                           CapsLock Deletor                         ;|
;-----------------------------------o---------------------------------o
;                     CapsLock + n  |  Ctrl + Delete (Delete a Word) ;|
;                     CapsLock + m  |  Delete                        ;|
;                     CapsLock + ,  |  BackSpace                     ;|
;                     CapsLock + .  |  Ctrl + BackSpace              ;|
;-----------------------------------o---------------------------------o
CapsLock & ,::
if GetKeyState("control") = 1                                        
    Send, ^{Del}
else Send, {Del} 
return
CapsLock & .::
if GetKeyState("control") = 1                                        
    Send, ^{Del}
else Send, {Del} 
return
CapsLock & m::
if GetKeyState("control") = 1                                        
    Send, ^{BS}
else Send, {BS}
return
CapsLock & n::
if GetKeyState("control") = 1                                        
    Send, ^{BS}
else Send, {BS} 
return
;---------------------------------------------------------------------o


;=====================================================================o
;                       CapsLock Media Controller                    ;|
;-----------------------------------o---------------------------------o
;                    CapsLock + F1  |  Volume_Mute                   ;|
;                    CapsLock + F2  |  Volume_Down                   ;|
;                    CapsLock + F3  |  Volume_Up                     ;|
;                    CapsLock + F3  |  Media_Play_Pause              ;|
;                    CapsLock + F5  |  Media_Next                    ;|
;                    CapsLock + F6  |  Media_Stop                    ;|
;-----------------------------------o---------------------------------o
CapsLock & F1:: Send, {Volume_Mute}                                  ;|
CapsLock & F2:: Send, {Volume_Down}                                  ;|
CapsLock & F3:: Send, {Volume_Up}                                    ;|
CapsLock & F4:: Send, {Media_Play_Pause}                             ;|
CapsLock & F5:: Send, {Media_Next}                                   ;|
CapsLock & F6:: Send, {Media_Stop}                                   ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                      CapsLock Window Controller                    ;|  
;-----------------------------------o---------------------------------o
;                     CapsLock + s  |  Ctrl + Tab (Swith Tab)        ;|
;                   CapsLock + w/q  |  Ctrl + W   (Close Tab)        ;|
;            Ctrl + CapsLock + w/q  |  Ctrl + Tab (Close App)        ;|
;                   CapsLock + tab  |  Alt + Tab  (Swith App)        ;|
;-----------------------------------o---------------------------------o
CapsLock & Tab::Send, !{Tab}                                         ;|
CapsLock & s::
if GetKeyState("control") = 1                                        
    Send, ^+{Tab}
else Send, ^{Tab} 
return
;-----------------------------------o                                ;|
CapsLock & q::
if GetKeyState("control") = 1                                        
    Send, !{F4}
else Send, ^w 
return
;-----------------------------------o                                ;|
CapsLock & w::
if GetKeyState("control") = 1                                        
    Send, !{F4}
else Send, ^w 
return
;---------------------------------------------------------------------o


;=====================================================================o
;                        Hyper App Launcher                  ;|
;-----------------------------------o---------------------------------o
;                     CapsLock + f  |  Ctrl + Space(Search via PowerToy);|
;                     CapsLock + e  |  Open Search Engine            ;|
;                     CapsLock + r  |  Open IDE                    ;|
;                     CapsLock + t  |  Open Terminal              ;|
;-----------------------------------o---------------------------------o
CapsLock & f:: Send, ^{Space}

CapsLock & e::
if GetKeyState("control") = 1                      
    Run explorer
else Run https://www.google.co.uk/ 
return

CapsLock & r::
if GetKeyState("control") = 1                                        
    Run C:\tools\Rider\rider64.lnk
else Run C:\tools\VS Code\Code.lnk 
return

CapsLock & t:: Run wt
;---------------------------------------------------------------------o


;=====================================================================o
;                        Hyper IDE                       ;|
;-----------------------------------o---------------------------------o
;                     CapsLock + ;  |  Enter (Cancel)                ;|
;                     CapsLock + '  |  =                             ;|
;                     CapsLock + [  |  Back         (Visual Studio)  ;|
;                     CapsLock + ]  |  Goto Define  (Visual Studio)  ;|
;                     CapsLock + /  |  Comment      (Visual Studio)  ;|
;                     CapsLock + \  |  Uncomment    (Visual Studio)  ;|
;                     CapsLock + 1  |  Build and Run(Visual Studio)  ;|
;                     CapsLock + 2  |  Debuging     (Visual Studio)  ;|
;                     CapsLock + 3  |  Step Over    (Visual Studio)  ;|
;                     CapsLock + 4  |  Step In      (Visual Studio)  ;|
;                     CapsLock + 5  |  Stop Debuging(Visual Studio)  ;|
;                     CapsLock + 6  |  Shift + 6     ^               ;|
;                     CapsLock + 7  |  Shift + 7     &               ;|
;                     CapsLock + 8  |  Shift + 8     *               ;|
;                     CapsLock + 9  |  Shift + 9     (               ;|
;                     CapsLock + 0  |  Shift + 0     )               ;|

;-----------------------------------o---------------------------------o
;                     CapsLock + v  |  move cursor left by word      ;|
;                     CapsLock + b  |  move cursor right by word     ;|
;-----------------------------------o---------------------------------o
CapsLock & v::
if GetKeyState("control") = 1                                        
    Send, +^{Left}
else Send, ^{Left} 
return

CapsLock & b::
if GetKeyState("control") = 1                                        
    Send, +^{Right}
else Send, ^{Right} 
return

;-----------------------------------o---------------------------------o
;                     CapsLock + 1  |  Clipboard 1      ;|
;                     CapsLock + 2  |  Clipboard 2     ;|
;                     CapsLock + 3  |  Clipboard 3     ;|
;-----------------------------------o---------------------------------o
CapsLock & 1::
if GetKeyState("control") = 1                                        
    Copy(1)
else Paste(1) 
return

CapsLock & 2::
if GetKeyState("control") = 1                                        
    Copy(2)
else Paste(2) 
return

CapsLock & 3::
if GetKeyState("control") = 1                                        
    Copy(3)
else Paste(3) 
return

;-----------------------------------o---------------------------------o

CapsLock & d:: Send, ^d                                              ;|
CapsLock & z:: Send, ^z                                              ;|
CapsLock & c:: Send, ^c                                              ;|

CapsLock & g::
if GetKeyState("control") = 1                                        
    Send, {AppsKey}
else Send, ^. 
return




CapsLock & `;:: Send, {Enter}                                        ;|
CapsLock & ':: Send, =                                               ;|
CapsLock & [:: Send, ^-                                              ;|
CapsLock & ]:: Send, {F12}                                           ;|
;-----------------------------------o                                ;|
CapsLock & /::                                                       ;|
Send, ^e                                                             ;|
Send, c                                                              ;|
return                                                               ;|
;-----------------------------------o                                ;|
CapsLock & \::                                                       ;|
Send, ^e                                                             ;|
Send, u                                                              ;|
return                                                               ;|
;-----------------------------------o                                ;|
CapsLock & 4:: Send,{F11}                                            ;|
CapsLock & 5:: Send,+{F5}                                            ;|
;-----------------------------------o                                ;|
CapsLock & 6:: Send,+6                                               ;|
CapsLock & 7:: Send,+7                                               ;|
CapsLock & 8:: Send,+8                                               ;|
CapsLock & 9:: Send,+9                                               ;|
CapsLock & 0:: Send,+0                                               ;|
;---------------------------------------------------------------------o