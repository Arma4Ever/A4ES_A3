/*
    initPlayerLocal.sqf
    Poniższy kod wykona się u każdego gracza w trakcie ładowania misji przez grę
*/
private ["_player","_jip"];
_player = _this select 0; //Zwraca postać gracza
_jip = _this select 1; //Zwraca true jesli gracz wchodzi w trakcie trwania misji, false jesli na starcie misji

//---- Import briefingu ----//
switch (side player) do {
    case west: {
    	#include "briefing\initBriefing_blufor.sqf"
	};
    case east: {
    	#include "briefing\initBriefing_opfor.sqf"
	};
    case independent: {
    	#include "briefing\initBriefing_indep.sqf"
	};
    case civilian: {
    	#include "briefing\initBriefing_civ.sqf"
	};
};