["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;

//if (_this select 1) exitWith {hint "YOU ARE JIP"};
//setPlayerRespawnTime (paramsArray select 1);

player execVM "briefing.sqf"; // laddar briefing så även JIP kan se det.

[SCREEN1, UGLY1, "UGLY1"] execVM "uavfeed.sqf"; // Hör till livefeed UAV kontrollen
[SCREEN2, UAV1, "UAV1"] execVM "uavfeed.sqf";
