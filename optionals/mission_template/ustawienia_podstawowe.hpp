/***************************************
         Ustawienia ogólne
****************************************/

//-- Autor misji --//
author="Nick autora";

//-- Tytuł misji --//
OnLoadName = "Nazwa misji";

//-- Krótki opis misji --//
OnLoadMission = "Opis misji";

//-- Krótki opis misji dla admina wybierającego misje --//
overviewText = "Nazwa misji | Nick autora";

//-- Ścieżka do zdjęcia tytułowego misji --//
loadScreen = "data\loadscreen.jpg";

//-- ID misji w kalendarzu --//
//-- Ustaw 0 jesli misja nieoficjalna/testowa --//
missionID = 0;

class Header
{
	//-- Typ gry --//
	gameType = Coop;

	//-- Minimalna ilość graczy pozwalająca ukończyć misje --//
	minPlayers = 16;

	//-- Ilość slotów na misji --//
	maxPlayers = 32;
};

/***************************************
         Zarządzanie ciałami
****************************************/

//-- Limit ciał --//
corpseLimit = 30;

//-- Czas w sek. po jakim ciało zostanie usunięte jeśli limit zostanie przekroczony --//
corpseRemovalMinTime = 300;

//-- Czas w sek. po jakim ciało zostanie usunięte jeli limit nie zostanie przekroczony --//
corpseRemovalMaxTime = 1800;

/***************************************
          Zarządzanie wrakami
****************************************/

//-- Limit wraków --//
wreckLimit = 10;

//-- Czas w sek. po jakim ciało zostanie usunięte jeśli limit zostanie przekroczony --//
wreckRemovalMinTime = 300;

//-- Czas w sek. po jakim ciało zostanie usunięte jeli limit nie zostanie przekroczony --//
wreckRemovalMaxTime = 3600;

/***************************************
           Ustawienia stałe
            NIE ZMIENIAĆ!
****************************************/
corpseManagerMode = 1;
wreckManagerMode = 1;
