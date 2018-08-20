// Task Force Radio-variabler (ändras ej).
TF_no_auto_long_range_radio = true;
TF_give_personal_radio_to_regular_soldier = true;
TF_give_microdagr_to_soldier = false;
TF_same_sw_frequencies_for_side = false;
TF_same_lr_frequencies_for_side = false;
TF_same_dd_frequencies_for_side = false;
TF_defaultWestRiflemanRadio = "tf_anprc152";
TF_defaultWestPersonalRadio = "tf_anprc152";
TF_defaultWestBackpack = "tf_rt1523g_big";
TF_defaultEastRiflemanRadio = "tf_fadak";
TF_defaultEastPersonalRadio = "tf_fadak";
TF_defaultEastBackpack = "tf_mr3000_rhs";
TF_defaultGuerRiflemanRadio = "tf_anprc148jem";
TF_defaultGuerPersonalRadio = "tf_anprc148jem";
TF_defaultGuerBackpack = "tf_anprc155_coyote";

// Kollar parameter för Farooq's revive-script.
if (!isNil "paramsArray") then {
	if (paramsArray select 0 == 1) then {
		call compileFinal preprocessFileLineNumbers "FAR_revive\FAR_revive_init.sqf";
	};
};

// Lägg till samtliga roller som är definierade i description.ext
//{[west, _x] call BIS_fnc_addRespawnInventory;} forEach ["WEST1", "WEST2", "WEST3", "WEST4", "WEST5", "WEST6", "WEST7", "WEST8", "WEST9", "WEST10", "WEST11", "WEST12", "WEST13", "WEST14", "WEST15", "WEST16", "WEST17", "WEST18", "WEST19", "WEST20", "WEST21", "WEST22"];

// Ökat visuellt avstånd
setViewDistance 5000;

// Exportera OCAP när scenariot avslutas
_endevent = addMissionEventHandler ["Ended",{
	systemChat "Mission has been ended!";
	hint "exporting"; [] call ocap_fnc_exportData;
}];


// Only run on clients, excluding HCs
[] spawn {

	// Delay until the server time has sync'd
	waitUntil {time > 5};
	// For JIP, wait until the main screen loads
	waitUntil {!isNull (findDisplay 46) };

	// Check if player name contains the word "Zeus"
	if (["game", format["%1",player]] call BIS_fnc_inString) then {		
	
		_checkIfValidCuratorSlot = {
			private _curatorList = _this;
			
			// Check that Zeus has been assigned to player
			if (isNull (getAssignedCuratorLogic player)) then {
				private _exitLoop = false;
				{	
					// Find an unassigned Zeus slot and assign it to the player
					if (isNull (getAssignedCuratorUnit _x)) then { 
						[player, _x] remoteExecCall ["assignCurator",2]; 
						sleep 2.0;
						// Check if a valid Zeus slot
						if (isNull (getAssignedCuratorLogic player)) then {
							// Broken Zeus slot, so clear and repeat
							_x remoteExecCall ["unassignCurator",2]; 
							sleep 2.0;
						} else {
							hint format["Zeus assigned to curator %1", _x];
							_exitLoop = true;
						};
					}; 
					if (_exitLoop) exitWith {}; 
					
				} forEach _curatorList; 
			};
		};		
		
		// Find all curators and reverse list so to lessen chance of admin Zeus conflicts
		private _curatorList = allcurators;
		reverse _curatorList;
		
		// Check that Zeus has been initially assigned to player
		_curatorList call _checkIfValidCuratorSlot;
		
		// Ensure Zeus keeps slot, despite admin logging
		while {true} do {
			// Check that Zeus has been assigned to player
			_curatorList call _checkIfValidCuratorSlot;
			
			sleep 10.0;			
		};			
	};		
};