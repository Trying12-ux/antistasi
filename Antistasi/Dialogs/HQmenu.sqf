#include "../macros.hpp"

AS_fncUI_openHQmenu = {
	disableSerialization;
	private ["_display","_childControl","_texto"];
	createDialog "HQmenu";

	_display = findDisplay 100;

	if (hayBE) then {[] remoteExec ["fnc_BE_calcPrice", 2]};

	if (str (_display) != "no display") then
	{
		_childControl = _display displayCtrl 109;
		if (hayBE) then {
			_texto = format ["Current Stage: %2 \nNext Stage Training Cost: %1 €", BE_currentPrice, BE_currentStage];
		} else {
			_texto = format ["Current level: %2. Next Level Training Cost: %1 €",1000 + (1.5*AS_P("skillFIA")*750),AS_P("skillFIA")];
		};
		_childControl  ctrlSetTooltip _texto;
	};
};
