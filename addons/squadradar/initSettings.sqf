// CBA Settings [ADDON: a3cs_squadradar]:

[
    QGVAR(enable), "CHECKBOX",
    ["Wlacz radar", "Pokaz radar druzyny"],
    LSTRING(Settings_Addon),
    true,
    2,
    {_this call FUNC(onSettingsChanged);}
] call CBA_settings_fnc_init;

[
    QGVAR(radarBackground), "LIST",
    ["Tlo radaru", "Textura uzywana jako tlo radaru"],
    LSTRING(Settings_Addon),
    [
      [
        "",
        QPATHTOF(data\radar\bg_blured.paa),
        QPATHTOF(data\radar\bg_sharp.paa),
        QPATHTOF(data\radar\bg_border.paa)
      ],
      [
        ELSTRING(common,None),
        LSTRING(Settings_radarBackground_Blured),
        LSTRING(Settings_radarBackground_Sharp),
        LSTRING(Settings_radarBackground_Border)
      ], 1
    ],
    2,
    {_this call FUNC(onSettingsChanged);}
] call CBA_settings_fnc_init;

[
    GVAR(radarBackgroundOpacity), "SLIDER",
    ["Widocznosc tla radaru", "Poziom widocznosci tla radaru (0 = 0%, 1 = 100%)"],
    LSTRING(Settings_Addon),
    [0, 1, 0.75, 2],
    2,
    {_this call FUNC(onSettingsChanged);}
] call CBA_fnc_addSetting;

[
    GVAR(memberlistColumnWidthScale), "SLIDER",
    ["Szerokosc kolumn listy czlonkow zespolu", "Szerokosc kolumn na liscie czlonkow druzyny (0 = 0%, 1 = 100%, 2 = 200%)"],
    LSTRING(Settings_Addon),
    [0, 2, 1, 2],
    2,
    {_this call FUNC(onSettingsChanged);}
] call CBA_fnc_addSetting;
