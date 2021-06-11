#include "script_component.hpp"
/*
 * Author: Bohemia Interavtive, SzwedzikPL
 * coverMap module function
 */

params ["_mode", "_input"];
TRACE_2(QUOTE(EXEC_MODULE_NAME),_mode,_input);

// Exit if module executed inside editor, not on server or not in init mode
if (is3DEN || !(isServer) || (_mode isNotEqualTo "init")) exitWith {};
_input params [
  ["_logic", objNull, [objNull]],
  ["_isActivated", false, [true]],
  ["_isCuratorPlaced", false, [true]]
];
// Exit if module is null, not local or placed by zeus (should not happen)
if (isNull _logic || !(local _logic) || _isCuratorPlaced) exitWith {};

LOG_1('Starting execution of EXEC_MODULE_NAME (isActivated: %1).',str _isActivated);

if (is3DENPreview) then {
  [_logic, _isActivated] call EFUNC(debug,updateModuleStatus);
};

/*
TODO: Refactor
make this override prev covermap, change markers, not create (won't hide markers placed over covers)
add layers id for changing markers from other module
*/

if (_isActivated) then {
  // Module activated, create cover markers
  private _pos = position _logic;
  _pos params ["_posX", "_posY"];
  (_logic getVariable ["objectarea", [0, 0, 0]]) params ["_sizeX", "_sizeY", "_dir"];

  // USE LAYER INSTEAD OF LOGIC ID
  private _logicId = _logic call BIS_fnc_netId;
	private _sizeOut = 50000;
  private _markers = [];
  private _dotMarkers = [];

  private _markerAlpha = _logic getVariable [QGVAR(coverOpacity), 0];
  private _markerColorId = _logic getVariable [QGVAR(coverColor), 0];
  private _markerColor = ["colorBlack", "colorWhite"] select _markerColorId;

	for "_i" from 0 to 270 step 90 do {
    // Calc sizes
		private _size1 = [_sizeX, _sizeY] select (abs cos _i);
		private _size2 = [_sizeX, _sizeY] select (abs sin _i);
		private _sizeMarker = [_size2, _sizeOut] select (abs sin _i);
		private _dirTemp = _dir + _i;

    // Create cover marker
    private _coverMarkerPos = [
      _posX + (sin _dirTemp * _sizeOut),
      _posY + (cos _dirTemp * _sizeOut)
    ];
		private _coverMarker = createMarker [
      format [QGVAR(coverMap_%1_cover_%2), _logicId, _i],
      _coverMarkerPos
    ];
		_coverMarker setMarkerPos _coverMarkerPos;
		_coverMarker setMarkerSize [_sizeMarker, _sizeOut - _size1];
		_coverMarker setMarkerDir _dirTemp;
		_coverMarker setMarkerShape "rectangle";
		_coverMarker setMarkerBrush "SolidFull";
		_coverMarker setMarkerColor _markerColor;
    _coverMarker setMarkerAlpha _markerAlpha;
    _markers pushBack _coverMarker;

    // Add corner dot marker if alpha isn't 1 or color is not black
    if ((_markerAlpha isNotEqualTo 1) || (_markerColorId isNotEqualTo 0)) then {
      _dotMarkers pushBack [
        format [QGVAR(coverMap_%1_dot_%2), _logicId, _i],
        [
          _posX + (sin _dirTemp * _size1) + (sin (_dirTemp + 90) * _size2),
          _posY + (cos _dirTemp * _size1) + (cos (_dirTemp + 90) * _size2)
        ]
      ];
    };
	};

	// Create border marker
  private _borderMarker = createMarker [
    format [QGVAR(coverMap_%1_border), _logicId],
    _pos
  ];
	_borderMarker setMarkerPos _pos;
	_borderMarker setMarkerSize [_sizeX, _sizeY];
	_borderMarker setMarkerDir _dir;
	_borderMarker setMarkerShape "rectangle";
	_borderMarker setMarkerBrush "border";
	_borderMarker setMarkerColor "colorBlack";
  _markers pushBack _borderMarker;

  // Create added dot markers
  // Last to create so they will be on top
  {
    _x params ["_dotMarkerName", "_dotMarkerPos"];
    private _dotMarker = createMarker [_dotMarkerName, _dotMarkerPos];
    _dotMarker setMarkerPos _dotMarkerPos;
    _dotMarker setMarkerSize [0.75, 0.75];
    _dotMarker setMarkerDir _dir;
    _dotMarker setMarkerType "mil_box_noShadow";
    _dotMarker setMarkerColor "colorBlack";
    _markers pushBack _dotMarker;
  } forEach _dotMarkers;

  // Save created markers in module
  _logic setVariable [QGVAR(coverMap_markers), _markers];
} else {
  // Module deactivated, remove cover markers
  {
    deleteMarker _x;
  } forEach (_logic getVariable [QGVAR(coverMap_markers), []]);
};

LOG('Execution of EXEC_MODULE_NAME finished.');
