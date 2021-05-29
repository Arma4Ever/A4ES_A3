
params ["_actionId", "_player"];


private _createdActions = GVAR(createdActions);
if !(_actionId in _createdActions) exitWith {

};
private _logic = _createdActions get _actionId;

// exec server handler
// delete logic if disposable
