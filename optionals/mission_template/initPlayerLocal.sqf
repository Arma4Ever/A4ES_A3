/***********************************************************************
    initPlayerLocal.sqf
    Poniższy kod wykona się lokalnie u gracza w trakcie ładowania misji przez grę
************************************************************************/
private ["_player","_jip"];

//-- Zwraca postać gracza który wchodzi na serwer --//
_player = param [0];

//-- Zwraca true jesli gracz wchodzi w trakcie trwania misji, false jesli na starcie misji --//
_jip = param [1];

//-- Twój kod --//