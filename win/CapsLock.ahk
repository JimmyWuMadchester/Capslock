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
;                     Hyper CapsLock Initializer                     ;|
;---------------------------------------------------------------------o
SetCapsLockState, AlwaysOff                                          ;|
;---------------------------------------------------------------------o
;                  CapsLock + Esc | {CapsLock}                       ;|
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
;                        CapsLock  |  {ESC}                          ;|
;----------------------------------o----------------------------------o
CapsLock::Send, {ESC}                                                ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                       Hyper Language Switch                        ;|
;---------------------------------o-----------------------------------o
;                    CapsLock + 4 | Win + Space                      ;|
;             CapsLock + Ctrl + 4 | £                                ;|
;---------------------------------o-----------------------------------o
CapsLock & 4::
if GetKeyState("control") = 1    
    Send, {U+00A3}
else Send, #{Space} 
return
;---------------------------------------------------------------------o


;=====================================================================o
;                             Hyper Space                            ;|
;---------------------------------o-----------------------------------o
;                CapsLock + Space | Language Switch                  ;|
;         CapsLock + Ctrl + Space | Emoji                            ;|
;---------------------------------o-----------------------------------o
CapsLock & Space::
if GetKeyState("control") = 1    
    Send, #.
else Send, #{Space} 
return
;---------------------------------------------------------------------o


;=====================================================================o
;                            Hyper Navigator                         ;|
;-----------------------------------o---------------------------------o
;                      CapsLock + h |  Left                          ;|
;               CapsLock + Ctrl + h |  Shift + Left (Select)         ;|
;                      CapsLock + j |  Down                          ;|
;               CapsLock + Ctrl + j |  Shift + Down (Select)         ;|
;                CapsLock + Alt + j |  Alt + Down                    ;|
;                      CapsLock + k |  Up                            ;|
;               CapsLock + Ctrl + k |  Shift + Up (Select)           ;|
;                CapsLock + Alt + k |  Alt + Up                      ;|
;                      CapsLock + l |  Right                         ;|
;               CapsLock + Ctrl + l |  Shift + Right (Select)        ;|
;-----------------------------------o---------------------------------o
CapsLock & h::                                                       
if GetKeyState("control") = 1                                        
    Send, +{Left}
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
else Send, {Right} 
return
;---------------------------------------------------------------------o
;                      CapsLock + i |  Home                          ;|
;               CapsLock + Ctrl + i |  Shift + Home (Select)         ;|
;                      CapsLock + o |  End                           ;|
;               CapsLock + Ctrl + o |  Shift + End (Select)         ;|
;                      +Ctrl for Selection                           ;|
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
;                      CapsLock + u |  PageUp                        ;|
;               CapsLock + Ctrl + u |  Shift + PageUp (Select)       ;|
;                      CapsLock + p |  PageDown                      ;|
;               CapsLock + Ctrl + p |  Shift + PageDown (Select)     ;|
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
;                     CapsLock + v  |  move cursor left by word      ;|
;                     CapsLock + b  |  move cursor right by word     ;|
;-----------------------------------o---------------------------------o
CapsLock & v::
if GetKeyState("control") = 1                                        
    Send, +^{Left}
else Send, ^{Left} 
return
; ----------------------------------o                               ;|
CapsLock & b::
if GetKeyState("control") = 1                                        
    Send, +^{Right}
else Send, ^{Right} 
return
;---------------------------------------------------------------------o


;=====================================================================o
;                              Hyper Deletion                        ;|
;-----------------------------------o---------------------------------o
;                     CapsLock + n  |  BackSpace                     ;|
;              CapsLock + Ctrl + n  |  Ctrl + BackSpace              ;|
;                     CapsLock + m  |  BackSpace                     ;|
;              CapsLock + Ctrl + m  |  Ctrl + BackSpace              ;|
;                     CapsLock + ,  |  Delete                        ;|
;              CapsLock + Ctrl + ,  |  Ctrl + Delete (Delete a Word) ;|
;                     CapsLock + .  |  Delete                        ;|
;              CapsLock + Ctrl + .  |  Ctrl + Delete (Delete a Word) ;|
;-----------------------------------o---------------------------------o
CapsLock & n::
if GetKeyState("control") = 1                                        
    Send, ^{BS}
else Send, {BS} 
return
;-----------------------------------o                                ;|
CapsLock & m::
if GetKeyState("control") = 1                                        
    Send, ^{BS}
else Send, {BS}
return
;-----------------------------------o                                ;|
CapsLock & ,::
if GetKeyState("control") = 1                                        
    Send, ^{Del}
else Send, {Del} 
return
;-----------------------------------o                                ;|
CapsLock & .::
if GetKeyState("control") = 1                                        
    Send, ^{Del}
else Send, {Del} 
return
;---------------------------------------------------------------------o





;=====================================================================o
;                        Hyper Window Controller                     ;|  
;-----------------------------------o---------------------------------o
;                     CapsLock + s  |  Ctrl + Tab (Swith Tab)        ;|
;              CapsLock + Ctrl + s  |  Ctrl + Shift + Tab (Swith Tab);|
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
;                            Hyper App Launcher                      ;|
;-----------------------------o---------------------------------------o
;               CapsLock + f  |  Ctrl + Space (Search via PowerToy)  ;|
;               CapsLock + e  |  Open Search Engine in Browser       ;|
;        CapsLock + Ctrl + e  |  Open Explorer                       ;|
;               CapsLock + r  |  Open VS Code                        ;|
;        CapsLock + Ctrl + r  |  Open Rider                          ;|
;               CapsLock + t  |  Open Terminal                       ;|
;               CapsLock + y  |  Open ?                              ;|
;-----------------------------o---------------------------------------o
CapsLock & f:: Send, ^{Space}
;-----------------------------o                                ;|
CapsLock & e::
if GetKeyState("control") = 1                      
    Run explorer
else Run https://www.google.co.uk/ 
return
;-----------------------------o                                ;|
CapsLock & r::
if GetKeyState("control") = 1                                        
    Run C:\tools\Rider\rider64.lnk
else Run C:\tools\VS Code\Code.lnk 
return
;-----------------------------o                                ;|
CapsLock & t:: Run wt
;---------------------------------------------------------------------o


;=====================================================================o
;                           Hyper Clipboard                          ;|
;-----------------------------------o---------------------------------o
;                     CapsLock + 1  |  Clipboard 1                   ;|
;                     CapsLock + 2  |  Clipboard 2                   ;|
;                     CapsLock + 3  |  Clipboard 3                   ;|
;-----------------------------------o---------------------------------o
CapsLock & 1::
if GetKeyState("control") = 1                                        
    Copy(1)
else Paste(1) 
return
; ----------------------------------o                               ;|
CapsLock & 2::
if GetKeyState("control") = 1                                        
    Copy(2)
else Paste(2) 
return
; ----------------------------------o                               ;|
CapsLock & 3::
if GetKeyState("control") = 1                                        
    Copy(3)
else Paste(3) 
return
;-----------------------------------o---------------------------------o


;=====================================================================o
;                              Hyper IDE                             ;|
;-----------------------------------o---------------------------------o
;                     CapsLock + /  |  Toggle Comment                ;|
;                     CapsLock + \  |  Toggle Comment                ;|
;-----------------------------------o---------------------------------o
CapsLock & /::                                                       ;|
Send, ^/                                                             ;|
return                                                               ;|
;-----------------------------------o                                ;|
CapsLock & \::                                                       ;|
Send, ^/                                                             ;|
return                                                               ;|
;-----------------------------------o---------------------------------o
;                     CapsLock + d  |  Ctrl + D (EOF)                ;|
;              CapsLock + Ctrl + d  |  Ctrl + Shift + K (Delete Line);|
;                     CapsLock + z  |  Ctrl + Z (SIGTSTP)            ;|
;              CapsLock + Ctrl + z  |  F5 (Start/Continue Debug)     ;|
;                     CapsLock + x  |  F1 (Command Palette)          ;|
;              CapsLock + Ctrl + x  |  Ctrl + F5 (Run)               ;|
;                     CapsLock + c  |  Ctrl + C (SIGINT)             ;|
;              CapsLock + Ctrl + c  |  Shift + F5 (STOP)             ;|
;-----------------------------------o---------------------------------o
CapsLock & d::
if GetKeyState("control") = 1                                        
    Send, ^+k
else Send, ^d
return
;-----------------------------------o
CapsLock & z:: 
if GetKeyState("control") = 1                                        
    Send, {F5}
else Send, ^z
return
;-----------------------------------o
CapsLock & x:: 
if GetKeyState("control") = 1                                        
    Send, ^{F5}
else Send, {F1}
return
;-----------------------------------o
CapsLock & c::
if GetKeyState("control") = 1                                        
    Send, +{F5}
else Send, ^c
return
;-----------------------------------o---------------------------------o
;                     CapsLock + g  |  Ctrl + . (Code Actions)       ;|
;              CapsLock + Ctrl + g  |  Menu Key                      ;|
;-----------------------------------o---------------------------------o
CapsLock & g::
if GetKeyState("control") = 1                                        
    Send, {AppsKey}
else Send, ^. 
return
;-----------------------------------o---------------------------------o
;                      CapsLock+ 0  |  F12 (Go to Definition)        ;|
;                CapsLock+ Ctrl+ 0  |  Alt+ F12 (Peek Definition)    ;|
;                      CapsLock+ -  |  Ctrl+Alt+ [ (Go Back)         ;|
;                CapsLock+ Ctrl+ -  |  Ctrl+Alt+ - (Fold)            ;|
;                      CapsLock+ =  |  Ctrl+Alt+ ] (Forward)         ;|
;                CapsLock+ Ctrl+ =  |  Ctrl+Alt+ = (Expand)          ;|
;-----------------------------------o---------------------------------o
CapsLock & 0::
if GetKeyState("control") = 1                                        
    Send, !{F12}
else Send, {F12} 
return
;-----------------------------------o
CapsLock & -::
if GetKeyState("control") = 1                                        
    Send, ^!{[}
else Send, ^!{-}
return
;-----------------------------------o
CapsLock & =::
if GetKeyState("control") = 1                                        
    Send, ^!{]}
else Send, ^!{=} 
return
;---------------------------------------------------------------------o




;=====================================================================o
; More keys beyond ANSI 60 Follows
;=====================================================================o

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