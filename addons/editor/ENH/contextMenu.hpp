class ENH_LogFactions {
	text = $STR_ENH_CONTEXTMENU_LOGFACTION;
	action = "call ENH_fnc_logFactions";
	conditionShow = "hoverObject";
};
class ENH_LogClassesString {
	action = "call ENH_fnc_logClassesString";
	Text = $STR_ENH_CONTEXTMENU_LOGCLASSESSTRING;
	conditionShow = "selectedObject + selectedWaypoint + selectedLogic + selectedMarker";
};
class ENH_LogPositions3D {
	action = "call ENH_fnc_logPositions3D";
	Text = $STR_ENH_CONTEXTMENU_LOGPOSITIONS3D;
	conditionShow = "selected - selectedMarker";
};
class ENH_LogPositions2D {
	action = "call ENH_fnc_logPositions2D";
	Text = $STR_ENH_CONTEXTMENU_LOGPOSITIONS2D;
	conditionShow = "selected";
};
class ENH_LogGridPositon {
	action = "call ENH_fnc_logGridPosition";
	Text = $STR_ENH_CONTEXTMENU_LOGGRIDPOSITION;
	conditionShow = "1";
};
class ENH_MeasureDistance {
	action = "[] spawn ENH_fnc_measureDistance";
	Text = $STR_ENH_CONTEXTMENU_MEASUREDISTANCE;
	picture = PATHTOF(ENH\data\icon_ruler.paa);
	conditionShow = "1";
	SHOW_IN_ROOT;
};
class ENH_Garrison {
	action = "findDisplay 313 createDisplay 'ENH_Garrison'";
	Text = $STR_ENH_CONTEXTMENU_GARRISON;
	picture = "\A3\ui_f\data\igui\cfg\simpleTasks\types\getin_ca.paa";
	conditionShow = "selected";
	opensNewWindow = 1;
	SHOW_IN_ROOT;
};
class ENH_DeleteCrew {
	action = "call ENH_fnc_deleteCrew";
	Text = $STR_ENH_CONTEXTMENU_DELETECREW;
	conditionShow = "hoverObjectVehicle";
};
class ENH_FirstPerson {
	action = "call ENH_fnc_firstPerson";
	Text = $STR_ENH_CONTEXTMENU_FIRSTPERSON;
	//conditionShow = "objectBrain";
};
