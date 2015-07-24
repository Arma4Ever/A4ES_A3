/***********************************************************************
	initPlayerServer.sqf
	Poniższy kod wykona się na serwerze za każdym razem gdy ktos wchodzi do misji (na starcie misji lub podczas jej trwania)
************************************************************************/
private ["_player","_jip"];

//-- Zwraca postać gracza który wchodzi na serwer --//
_player = param [0];

//-- Zwraca true jesli gracz wchodzi w trakcie trwania misji, false jesli na starcie misji --//
_jip = param [1];

//-- Twój kod --//