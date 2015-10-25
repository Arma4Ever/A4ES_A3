/*
	Autor: SzwedzikPL
	Opis: Odpowiedź na pytanie (client)
*/
#include "script_component.hpp"

if(isDedicated) exitWith {};
if(!dialog) exitWith {};
if(count a3c_sys_var_actualAnswers == 0) exitWith {};

_index = lbCurSel 1500;
_answer = "Nie rozumiem pytania.";
{
	if((_x select 0) == _index) then {
		_answer = _x select 1;
	};
} forEach a3c_sys_var_actualAnswers;

_answerActual = "";
_answerArray = toArray _answer;

a3c_sys_var_dialog_isTalking = false;
sleep 0.1;
a3c_sys_var_dialog_isTalking = true;
{
	_answerActual = format ["%1%2", _answerActual, toString [_x]];
	ctrlSetText [1501, _answerActual];
	sleep 0.03;
	if(!a3c_sys_var_dialog_isTalking || !dialog) exitWith {};
} forEach _answerArray;
