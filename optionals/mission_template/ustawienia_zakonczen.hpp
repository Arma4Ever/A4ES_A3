//---- Deklaracja zakończeń (opcjonalne) ----//
// Dokumentacja BI: https://community.bistudio.com/wiki/Debriefing

class CfgDebriefing {
    class End1 {
        title = "MISJA ZAKOŃCZONA";
        subtitle = "Wszystkie zadania zostały wykonane";
        description = "Misja zakończona sukcesem";
        pictureBackground = "data\loadscreen.jpg";
        picture = "data\a3c.paa";
        pictureColor[] = {1,1,1,1};
    };
    class End2 {
        title = "MISJA ZAKOŃCZONA";
        subtitle = "Misja nie powiodła się";
        description = "Misja zakończona niepowodzeniem";
        pictureBackground = "data\loadscreen.jpg";
        picture = "data\a3c.paa";
        pictureColor[] = {1,1,1,1};
    };

    //Poniższa klasa zostanie wywołana AUTOMATYCZNIE w przypadku gdy wszyscy gracze zginą
    class endDeath {
        title = "MISJA ZAKOŃCZONA";
        subtitle = "Wszystkie jednostki poległy";
        description = "Misja zakończona niepowodzeniem";
        pictureBackground = "";
        picture = "KIA";
        pictureColor[] = {0.6,0.1,0.2,1};
    };
};
