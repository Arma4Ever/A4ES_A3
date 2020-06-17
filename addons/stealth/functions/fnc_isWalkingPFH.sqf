
private _isWalking = isWalking ace_player;

if (_isWalking isEqualTo GVAR(isWalking)) exitWith {};

if (_isWalking) then {
  //GVAR(walkingPFH) =
  // remove GVAR(isWalkingPFH)
} else {
  // remove pfh
};

GVAR(isWalking) = _isWalking;
