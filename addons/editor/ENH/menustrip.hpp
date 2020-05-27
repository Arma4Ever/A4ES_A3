class ENH_Folder_Placement {
    text = $STR_ENH_FOLDER_PLACEMENTTOOLS;
    picture = "\a3\3DEN\Data\Displays\Display3DEN\ToolBar\open_ca.paa";
    items[] += {
        "ENH_PlacementTools",
        "Separator",
        "ENH_SetRandomDir",
        "ENH_ReverseDirection",
        "Separator",
        "ENH_OrientateNorth",
        "ENH_OrientateEast",
        "ENH_OrientateSouth",
        "ENH_OrientateWest"
    };
};
class ENH_Folder_Utilities {
    text = $STR_ENH_FOLDER_UTILITIES;
    picture = "\a3\3DEN\Data\Displays\Display3DEN\ToolBar\open_ca.paa";
    items[] += {
        "ENH_Jukebox",
        "ENH_MoonPhases",
        "ENH_ScriptCommands",
        "Separator",
        "ENH_BatchReplace",
        "ENH_NameObjects",
        "ENH_TextureFinder"
    };
};
class ENH_Folder_Miscellaneous {
    text = $STR_ENH_FOLDER_MISCELLANEOUS;
    picture = "\a3\3DEN\Data\Displays\Display3DEN\ToolBar\open_ca.paa";
    items[] += {
        "ENH_DeleteEmptyLayers",
        "ENH_ToggleSimpleObject",
        "ENH_ToggleSimulation",
        "ENH_ToggleDrawBuildingPositions",
        "ENH_ToggleDrawDLCIcons"
    };
};
//Utilities
class ENH_MoonPhases {
    text = $STR_ENH_TOOLS_MOONPHASES;
    action = "[] execVM 'A3\Functions_F\Debug\Utilities\utility_moonPhases.sqf'";
    opensNewWindow = 1;
};
class ENH_Jukebox {
    text = $STR_ENH_TOOLS_JUKEBOX;
    action = "[] execVM 'A3\Functions_F\Debug\Utilities\utility_jukebox.sqf'";
    opensNewWindow = 1;
};
class ENH_ScriptCommands {
    text = $STR_ENH_TOOLS_SCRIPTCOMMANDS;
    action = "[] execVM 'A3\Functions_F\Debug\Utilities\utility_scriptCommands.sqf'";
    opensNewWindow = 1;
};
class ENH_BatchReplace {
    text = $STR_ENH_TOOLS_BATCHREPLACE;
    action = "call ENH_fnc_batchReplace_createDisplay";
    shortcuts[] = {INPUT_ALT_OFFSET + DIK_R};
    opensNewWindow = 1;
};
class ENH_NameObjects {
    text = $STR_ENH_TOOLS_BATCHNAMING;
    action = "findDisplay 313 createDisplay 'ENH_NameObjects'";
    shortcuts[] = {INPUT_ALT_OFFSET + DIK_N};
    opensNewWindow = 1;
};
class ENH_TextureFinder {
    text = $STR_ENH_TEXTUREFINDER;
    picture = "\A3\ui_f\data\igui\cfg\simpleTasks\types\search_ca.paa";
    action = "findDisplay 313 createDisplay 'ENH_TextureFinder'";
    shortcuts[] = {INPUT_ALT_OFFSET + DIK_T};
    opensNewWindow = 1;
};
// Miscellaneous
class ENH_DeleteEmptyLayers {
    text = $STR_ENH_TOOLS_DELETEEMPTYLAYERS;
    picture = "\a3\3DEN\Data\Displays\Display3DEN\PanelLeft\entityList_delete_ca.paa";
    action = "call ENH_fnc_deleteEmptyLayers";
};
class ENH_ToggleSimpleObject {
    text = $STR_ENH_TOOLS_TOGGLESIMPLEOBJECT;
    picture = "";
    action = "[['Object'],'objectIsSimple'] call ENH_fnc_toggleAttribute";
    shortcuts[] = {INPUT_ALT_OFFSET + DIK_S};
};
class ENH_ToggleSimulation {
    text = $STR_ENH_TOOLS_TOGGLESIMULATION;
    picture = "";
    action = "[['Object'],'enableSimulation'] call ENH_fnc_toggleAttribute";
    shortcuts[] = {INPUT_ALT_OFFSET + DIK_E};
};
class ENH_ToggleDrawBuildingPositions {
    text = $STR_ENH_TOOLS_DRAWBUILDINGPOSITIONS;
    action = "call ENH_fnc_toggleDrawBuildingPositions";
    shortcuts[] = {INPUT_ALT_OFFSET + DIK_P};
};
class ENH_ToggleDrawDLCIcons {
    text = $STR_ENH_TOOLS_DRAWDLCICONS;
    action = "call ENH_fnc_toggleDrawDLCIcons";
    shortcuts[] = {INPUT_ALT_OFFSET + DIK_I};
};
// Vanilla
class FunctionsViewer//Overwrites the default function viewer {
    action = "findDisplay 313 createDisplay 'ENH_FunctionsViewer'";
    data = "";
    opensNewWindow = 1;
    shortCuts[] = {INPUT_ALT_OFFSET + DIK_F};
};
class ConfigViewer {
    shortCuts[] = {INPUT_ALT_OFFSET + DIK_C};
};
class DebugConsole {
    shortCuts[] = {INPUT_CTRL_OFFSET + DIK_D};
};
// Placement Tools
class ENH_PlacementTools {
    text = $STR_ENH_TOOLS_PLACEMENTTOOLS;
    action = "call ENH_fnc_placementTools_createDisplay";
    shortcuts[] = {INPUT_CTRL_OFFSET + DIK_L};
    opensNewWindow = 1;
};
class ENH_SetRandomDir {
    Text = $STR_ENH_TOOLS_RANDOMDIR;
    picture = "\a3\3DEN\Data\Displays\Display3DEN\ToolBar\widget_rotation_off_ca.paa";
    action = "-1 call ENH_fnc_setOrientation";
    conditionShow = "selectedObject + selectedWaypoint + selectedLogic + selectedMarker";
    shortcuts[] = {INPUT_CTRL_OFFSET + DIK_NUMPAD3};
};
class ENH_ReverseDirection {
    text = $STR_ENH_TOOLS_REVERSEDIRECTION;
    picture = "\A3\ui_f\data\igui\rsctitles\mpprogress\respawn_ca.paa";
    action = "-2 call ENH_fnc_setOrientation";
    shortcuts[] = {INPUT_CTRL_OFFSET + DIK_NUMPAD7};
};
class ENH_OrientateNorth {
    text = $STR_ENH_TOOLS_ORIENTATENORTH;
    picture = "\A3\ui_f\data\igui\cfg\simpleTasks\letters\N_ca.paa";
    action = "0 call ENH_fnc_setOrientation";
    shortcuts[] = {INPUT_CTRL_OFFSET + DIK_NUMPAD8};
};
class ENH_OrientateEast: ENH_OrientateNorth {
    text = $STR_ENH_TOOLS_ORIENTATEEAST;
    picture = "\A3\ui_f\data\igui\cfg\simpleTasks\letters\E_ca.paa";
    action = "90 call ENH_fnc_setOrientation";
    shortcuts[] = {INPUT_CTRL_OFFSET + DIK_NUMPAD6};
};
class ENH_OrientateSouth: ENH_OrientateNorth {
    text = $STR_ENH_TOOLS_ORIENTATESOUTH;
    picture = "\A3\ui_f\data\igui\cfg\simpleTasks\letters\S_ca.paa";
    action = "180 call ENH_fnc_setOrientation";
    shortcuts[] = {INPUT_CTRL_OFFSET + DIK_NUMPAD2};
};
class ENH_OrientateWest: ENH_OrientateNorth {
    text = $STR_ENH_TOOLS_ORIENTATEWEST;
    picture = "\A3\ui_f\data\igui\cfg\simpleTasks\letters\W_ca.paa";
    action = "270 call ENH_fnc_setOrientation";
    shortcuts[] = {INPUT_CTRL_OFFSET + DIK_NUMPAD4};
};
