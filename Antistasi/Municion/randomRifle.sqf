private ["_unit","_compatibles","_posibles","_rifle","_helmet","_uniform","_vest"];

_unit = _this select 0;

_rifle = _this select 1;
_helmet = _this select 2;
_uniform = _this select 3;
_vest = _this select 4;
_rifleFinal = "";

_skillFIA = server getVariable "skillFIA";

removeVest _unit;
_vest = ([caja, "vest"] call AS_fnc_getBestItem);
if (!isnil "_vest") then {
	_unit addVest _vest;
	// todo: add items to vest.
	caja removeItem _vest;
};

_helmet = ([caja, "helmet"] call AS_fnc_getBestItem);
if (!isnil "_helmet") then {
	_unit addHeadgear _helmet;
	caja removeItem _helmet;
};

_unit removeMagazines (currentMagazine _unit);
_unit removeWeaponGlobal (primaryWeapon _unit);

_weapon = ([caja] call AS_fnc_getBestWeapon);
if (!isnil "_weapon") then {
	[_unit, _weapon, 0, 0] call BIS_fnc_addWeapon;
	caja removeWeapon _weapon;
};

/* 

if (_rifle) then
	{
	_mag = currentMagazine _unit;
	_unit removeMagazines _mag;
	_unit removeWeaponGlobal (primaryWeapon _unit);
	_rifleFinal = unlockedRifles call BIS_fnc_selectRandom;
	if (_rifleFinal in genGL) then {
		if !(hayRHS) then {_unit addMagazine ["1Rnd_HE_Grenade_shell", 4];}
		else {_unit addMagazine ["rhs_VOG25", 4];};
	};
	[_unit, _rifleFinal, 5, 0] call BIS_fnc_addWeapon;
	if (count unlockedOptics > 0) then
			{
			_compatibles = [primaryWeapon _unit] call BIS_fnc_compatibleItems;
			_posibles = [];
			{
			if (_x in _compatibles) then {_posibles pushBack _x};
			} forEach unlockedOptics;
			_unit addPrimaryWeaponItem (_posibles call BIS_fnc_selectRandom);
			};
	};

if (_uniform) then {
	// BE module
	if (hayBE) then {
		_result = ["outfit"] call fnc_BE_getCurrentValue;
		if (random 100 > _result) then {
			_unit forceAddUniform (civUniforms call BIS_fnc_selectRandom);
			_unit addItemToUniform "FirstAidKit";
			if !(hayRHS) then {
				_unit addMagazine ["HandGrenade", 1];
				_unit addMagazine ["SmokeShell", 1];
			} else {
				_unit addMagazine "rhs_mag_rdg2_white";
				_unit addMagazine "rhs_mag_rgd5";
			};
		};
	}
	// BE module
	else {
		if (random 10 > _skillFIA) then {
			_unit forceAddUniform (civUniforms call BIS_fnc_selectRandom);
			_unit addItemToUniform "FirstAidKit";
			if !(hayRHS) then {
				_unit addMagazine ["HandGrenade", 1];
				_unit addMagazine ["SmokeShell", 1];
			} else {
				_unit addMagazine "rhs_mag_rdg2_white";
				_unit addMagazine "rhs_mag_rgd5";
			};
		};
	};
};

if (hayTFAR) then {
	_unit addItem "tf_anprc152";
	_unit assignItem "tf_anprc152";
}; */