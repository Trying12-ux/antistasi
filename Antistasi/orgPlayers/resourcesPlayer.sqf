_dinero = _this select 0;

_dinero = _dinero + (player getVariable "dinero");
if (_dinero < 0) then {_dinero = 0};
player setVariable ["dinero",_dinero,true];
true
