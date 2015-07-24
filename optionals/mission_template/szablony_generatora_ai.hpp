/***********************************************************************
	Szablony oddziałów do generatora AI

	Opis wartosci:
	unitClass - klasa jednostki
	gearTemplate - klasa szablonu wyposażenie, jesli ma być użyte
	wyposażenie domyslne wstaw ""
	groupPart - % ilosci w oddziale, np. jesli w oddziale mamy 2 klasy
	i obie maja ustawione groupPart = 1 to maja takie samo prawdopodobienstwo pojawienia
	sie i skład bedzie mieszany totalnie losowo. Jesli jedna z tych klas bedzie miala groupPart = 0.5 a
	druga groupPart = 1 to mozna zalozyc ze jednostek klasy pierwszej bedzie 2 razy wiecej niz klasy
	drugiej.
	skill - % umiejetnosci danej jednostki, 0 - totalne warzywo nie trafiajace z 10m, 1 - super delta specnaz
	navy seal strzelajacy celnie na 800m-1km. Domyslna wartosc to 0.5.
************************************************************************/


class genUnitTemplates {
	class przykladowy_oddzial {
		class strzelec1 {
			unitClass = "rhs_msv_rifleman";
			gearTemplate = "przykladowy_sprzet_strzelca";
			groupPart = 0.7;
			skill = 0.5;
		};
		class strzelec2_at {
			unitClass = "rhs_msv_rifleman";
			gearTemplate = "przykladowy_sprzet_strzelca_at";
			groupPart = 0.3;
			skill = 0.55;
		};
	};
};