// CBA Settings [ADDON: a3cs_squadradar]:

[
    QGVAR(enable), "CHECKBOX",
    [LSTRING(Settings_enable), LSTRING(Settings_enable_Tooltip)],
    LSTRING(Settings_Addon),
    true,
    2,
    {_this call FUNC(handleSettingsChanged);}
] call CBA_settings_fnc_init;

[
    QGVAR(showRadar), "CHECKBOX",
    [LSTRING(Settings_showRadar), LSTRING(Settings_showRadar_Tooltip)],
    LSTRING(Settings_Addon),
    true,
    2,
    {_this call FUNC(handleSettingsChanged);}
] call CBA_settings_fnc_init;

[
    QGVAR(showMemberlist), "CHECKBOX",
    [LSTRING(Settings_showMemberlist), LSTRING(Settings_showMemberlist_Tooltip)],
    LSTRING(Settings_Addon),
    true,
    2,
    {_this call FUNC(handleSettingsChanged);}
] call CBA_settings_fnc_init;

[
    QGVAR(showSpecialStates), "CHECKBOX",
    [LSTRING(Settings_showSpecialStates), LSTRING(Settings_showSpecialStates_Tooltip)],
    LSTRING(Settings_Addon),
    true,
    2,
    {_this call FUNC(handleSettingsChanged);}
] call CBA_settings_fnc_init;

[
    QGVAR(showFingerPointers), "CHECKBOX",
    [LSTRING(Settings_showFingerPointers), LSTRING(Settings_showFingerPointers_Tooltip)],
    LSTRING(Settings_Addon),
    true,
    2,
    {_this call FUNC(handleSettingsChanged);}
] call CBA_settings_fnc_init;

[
    QGVAR(radarBackground), "LIST",
    [LSTRING(Settings_radarBackground), LSTRING(Settings_radarBackground_Tooltip)],
    [LSTRING(Settings_Addon), "str_a3_rscdisplaygameoptions_buttongui"],
    [
      [
        "",
        QPATHTOF(data\radar\bg_blurred.paa),
        QPATHTOF(data\radar\bg_sharp.paa),
        QPATHTOF(data\radar\bg_border.paa)
      ],
      [
        ELSTRING(common,None),
        LSTRING(Settings_radarBackground_Blurred),
        LSTRING(Settings_radarBackground_Sharp),
        LSTRING(Settings_radarBackground_Border)
      ], 1
    ],
    2,
    {_this call FUNC(handleSettingsChanged);}
] call CBA_settings_fnc_init;

[
    QGVAR(uiScale), "SLIDER",
    [LSTRING(Settings_uiScale), LSTRING(Settings_uiScale_Tooltip)],
    [LSTRING(Settings_Addon), LSTRING(Settings_GUI)],
    [1, 2, 1, 2],
    2,
    {_this call FUNC(handleSettingsChanged);}
] call CBA_settings_fnc_init;

[
    QGVAR(radarBackgroundOpacity), "SLIDER",
    [LSTRING(Settings_radarBackgroundOpacity), LSTRING(Settings_OpacityTooltip)],
    [LSTRING(Settings_Addon), LSTRING(Settings_GUI)],
    [0, 1, 0.75, 2],
    2,
    {_this call FUNC(handleSettingsChanged);}
] call CBA_settings_fnc_init;

[
    QGVAR(radarIconsOpacity), "SLIDER",
    [LSTRING(Settings_radarIconsOpacity), LSTRING(Settings_OpacityTooltip)],
    [LSTRING(Settings_Addon), LSTRING(Settings_GUI)],
    [0, 1, 1, 2],
    2,
    {_this call FUNC(handleSettingsChanged);}
] call CBA_settings_fnc_init;

[
    QGVAR(memberlistTextScale), "SLIDER",
    [LSTRING(Settings_memberlistTextScale), LSTRING(Settings_memberlistTextScale_Tooltip)],
    [LSTRING(Settings_Addon), LSTRING(Settings_GUI)],
    [0, 2, 1, 2],
    2,
    {_this call FUNC(handleSettingsChanged);}
] call CBA_settings_fnc_init;

[
    QGVAR(memberlistOpacity), "SLIDER",
    [LSTRING(Settings_memberlistOpacity), LSTRING(Settings_OpacityTooltip)],
    [LSTRING(Settings_Addon), LSTRING(Settings_GUI)],
    [0, 1, 1, 2],
    2,
    {_this call FUNC(handleSettingsChanged);}
] call CBA_settings_fnc_init;

[
    QGVAR(memberlistColumnWidthScale), "SLIDER",
    [LSTRING(Settings_memberlistColumnWidthScale), LSTRING(Settings_memberlistColumnWidthScale_Tooltip)],
    [LSTRING(Settings_Addon), LSTRING(Settings_GUI)],
    [0, 2, 1, 2],
    2,
    {_this call FUNC(handleSettingsChanged);}
] call CBA_settings_fnc_init;

[
    QGVAR(memberlistTextShadow), "LIST",
    [LSTRING(Settings_memberlistTextShadow), LSTRING(Settings_memberlistTextShadow_Tooltip)],
    [LSTRING(Settings_Addon), LSTRING(Settings_GUI)],
    [
      [
        0,
        1,
        2
      ],
      [
        ELSTRING(common,None),
        LSTRING(Settings_memberlistTextShadow_Classic),
        LSTRING(Settings_memberlistTextShadow_Outline)
      ], 1
    ],
    2,
    {_this call FUNC(handleSettingsChanged);}
] call CBA_settings_fnc_init;

[
    QGVAR(fingerPointerColor), "COLOR",
    [LSTRING(Settings_fingerPointerColor), LSTRING(Settings_fingerPointerColor_Tooltip)],
    [LSTRING(Settings_Addon), LSTRING(Settings_GUI)],
    [1, 0.65, 0, 0.65],
    2
] call CBA_settings_fnc_init;
