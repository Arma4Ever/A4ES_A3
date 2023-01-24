/*

#2 - 2+4 / 1+13
#3 - 2+3 / 1+12.5
#4 - 1+4 / 1+13
#5 - 1+5 / 1+14
#6 - 1+4 / 1+14
#7 - 1+4 / 1+15
#8 - 1+4 / 1+15.5

*/


testspawn = 0 spawn {
setAccTime 30;

private _states = [];

while {true} do {
  [player] call ace_medical_treatment_fnc_fullHealLocal;
  sleep 2;
  private _r1 = 1 + (floor (random 5));
  private _data = [];
  for "_x" from 1 to _r1 do {
    private _dmg = 1 + (random 15.5);
    [player, _dmg, "body", "vehiclecrash"] call ace_medical_fnc_addDamageToUnit;
    _data pushBack _dmg;
  };
  private _start = CBA_missionTime;
  private _end = _start + 65;

  sleep 0.5;

  private _initBleed = player getVariable ["ace_medical_bloodVolume", 6];

  waitUntil {
    !(player getVariable ["ACE_isUnconscious", false]) || {CBA_missionTime > _end}
  };

  _states pushBack (player getVariable ["ACE_isUnconscious", false]);

  private _woundsCount = count (player getVariable ["ace_medical_openWounds", []]);
  private _heartRate = player getVariable ["ace_medical_heartRate", 80];
  private _bleed = player getVariable ["ace_medical_bloodVolume", 6];

  diag_log text format [
    "%1,%2,%3,%4,%5,%6,%7,%8",
    _r1,
    str _data,
    _initBleed,
    player getVariable ["ACE_isUnconscious", false],
    _woundsCount,
    floor _heartRate,
    _bleed,
    (CBA_missionTime - _start) toFixed 1
  ];

  systemChat format ["#%1 - %2%3", count _states, ((({!_x} count _states) / (count _states)) * 100) toFixed 1,"%"];
};
};
