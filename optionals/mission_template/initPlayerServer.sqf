/*
	initPlayerServer.sqf
	Poniższy kod wykona się na serwerze za każdym razem gdy ktos wchodzi do misji (na starcie misji lub podczas jej trwania)
*/
private ["_player","_jip"];
_player = _this select 0; //Zwraca postać gracza który wchodzi na serwer / bierze udział w misji
_jip = _this select 1; //Zwraca true jesli gracz wchodzi w trakcie trwania misji, false jesli na starcie misji