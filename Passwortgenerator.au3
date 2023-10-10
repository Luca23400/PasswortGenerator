#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.16.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include <GUIConstantsEx.au3>
#include <String.au3>
#include <Array.au3>
#include <Clipboard.au3>
Global $password

MainGUI()

Func MainGUI()
    Local $lengthInput, $lengthLabel, $generateButton

    GUICreate("Passwort Generator", 300, 150)
    $lengthLabel = GUICtrlCreateLabel("Länge:", 10, 20, 50, 20)
    $lengthInput = GUICtrlCreateInput("", 60, 20, 50, 20)
    $generateButton = GUICtrlCreateButton("Generieren", 120, 20, 80, 20)
	$outputLabel = GUICtrlCreateLabel("",50,80,250,20)
    GUISetState(@SW_SHOW)

    While 1
        Switch GUIGetMsg()
            Case $GUI_EVENT_CLOSE
                Exit
            Case $generateButton
                Local $passwordLength = GUICtrlRead($lengthInput)
				$password = GeneratePassword($passwordLength)
				;MsgBox(0,"",$password)
				GUICtrlSetData($outputLabel,$password)
				_ClipBoard_SetData($password)
                ;If IsNumber($passwordLength) And $passwordLength > 0 Then
                 ;   Local $password = GeneratePassword($passwordLength)
                  ;  MsgBox(0, "Passwort Generator", "Generiertes Passwort: " & $password)
                ;Else
                 ;   MsgBox(0, "Fehler", "Bitte geben Sie eine gültige Zahl für die Passwortlänge ein.")
               ; EndIf
        EndSwitch
    WEnd
EndFunc

Func GeneratePassword($length)
    Local $password = ""
    Local $characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+-=[]{}\|;:'\,."
    Local $charArray = StringSplit($characters, "")
    Local $charCount = UBound($charArray) - 1

    For $i = 1 To $length
        $password &= $charArray[Random(1, $charCount, 1)]
    Next

    Return $password
EndFunc
