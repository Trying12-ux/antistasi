#include "../macros.hpp"
params ["_veh"];

if (_veh getVariable ["inDespawner",false]) exitWith {};
_veh setVariable ["inDespawner",true,true];

if ((typeOf _veh in arrayCivVeh) and
	{{_x getVariable ["BLUFORSpawn", false]} count crew _veh > 0} and
	{_veh distance getMarkerPos "FIA_HQ" > 50}) then {

	private _pos = position _veh;
	[0,-1,_pos] remoteExec ["citySupportChange",2];
	private _city = [call AS_fnc_location_cities, _pos] call BIS_fnc_nearestPosition;

	private _AAFsupport = [_city, "AAFsupport"] call AS_fnc_location_get;
	sleep 5;
	if (random 100 < _AAFsupport) then {
		{
			private _amigo = _x;
			if ((captive _amigo) and (isPlayer _amigo)) then {
				[_amigo,false] remoteExec ["setCaptive",_amigo];
			};
			{
				if ((side _x == side_green) and {_x distance _pos < AS_P("spawnDistance")}) then {
					_x reveal [_amigo, 4]
				};
			} forEach allUnits;
		} forEach crew _veh;
	};
};

while {alive _veh} do {
	if ((not([AS_P("spawnDistance"),1, _veh,"BLUFORSpawn"] call distanceUnits)) and
		(not([AS_P("spawnDistance"),1, _veh,"OPFORSpawn"] call distanceUnits)) and
		(not(_veh in AS_P("vehicles"))) and (_veh distance getMarkerPos "FIA_HQ" > 100)) then {
		if (_veh in reportedVehs) then {
			reportedVehs = reportedVehs - [_veh];
			publicVariable "reportedVehs";
		};
		deleteVehicle _veh
	};
	sleep (5 + random 5);
};
