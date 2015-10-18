#include "script_component.hpp"

params ["_target"];
private ["_unitData", "_pos", "_relPos", "_distance", "_heightOffset", "_heightOffset2", "_position", "_position2", "_size", "_scale"];

_unitData = [_target] call FUNC(getUnitData);
_unitData params ["_unitName", "_unitRank", "_unitIcon", "_unitColorHex", "_unitColorArma"];

_pos = positionCameraToWorld [0, 0, 0];
if (!surfaceIsWater _pos) then {_pos = ATLtoASL _pos;};

_relPos = (visiblePositionASL _target) vectorDiff _pos;
_distance = vectorMagnitude _relPos;
_heightOffset = _distance * 0.026;
_heightOffset2 = _distance * 0.044;

// Convert position to ASLW (expected by drawIcon3D) and add height offsets
_position = _target modelToWorldVisual ((_target selectionPosition "pilot") vectorAdd [0,0,(_heightOffset + .3)]);
_position2 = _target modelToWorldVisual ((_target selectionPosition "pilot") vectorAdd [0,0,(_heightOffset2 + .3)]);

_size = 1;
_scale = 0.83333;

//Draw name
drawIcon3D [
    "",
    _unitColorArma,
    _position,
    0,
    0,
    0,
    _unitName,
    2,
    (0.05 * _scale),
    "PuristaMedium"
];

//Draw rank
drawIcon3D [
    "",
    [1,1,1,1],
    _position2,
    0,
    0,
    0,
    _unitRank,
    2,
    (0.04 * _scale),
    "PuristaLight"
];
