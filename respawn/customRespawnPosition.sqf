#define RANDOM_DATA	"<random>"
#define RANDOM_VALUE	-1000

_unit = _this param [0,objnull,[objnull]];
if (isnull _unit) then {
	_mode = _this select 1;
	_this = _this select 2;
	switch _mode do {
		case "draw": {
			_ctrlMap = _this select 0;
			_display = ctrlparent _ctrlMap;

			if (shownmap) then {
				_ctrlList = _display displayctrl BIS_fnc_respawnMenuPosition_ctrlList;
				_selected = abs(_ctrlList lbvalue lbcursel _ctrlList);

				//--- Draw icons on respawn positions
				_color = (player call bis_fnc_objectSide) call bis_fnc_sidecolor;
				_icon = "selector_selectedFriendly" call bis_fnc_textureMarker;
				_iconSelected = "selector_selectedMission" call bis_fnc_textureMarker;
				_iconDanger = "mil_warning" call bis_fnc_textureMarker;

				{
					_pos = _x call bis_fnc_position;
					_colorLocal = if (_x in [BIS_fnc_respawnMenuPosition_selected,BIS_fnc_respawnMenuPosition_respawn]) then {[1,1,1,1]} else {_color};
					_colorDanger = ["IGUI", "WARNING_RGB"] call bis_fnc_displayColorGet;
					_colorDanger set [3, 1];
					_iconLocal = if (_foreachindex == _selected) then {_iconSelected} else {_icon};

					_ctrlMap drawicon [
						_iconLocal,
						_colorLocal,
						_pos,
						48,
						48,
						time * 16,
						"",
						1
					];

					// If area has enemies nearby add adicional overlay
					if ({ alive _x && {side group _x != side group player} && {_x distance _pos <= 100} } count allUnits > 0) then
					{
						_ctrlMap drawicon [
							_iconDanger,
							_colorDanger,
							_pos,
							30,
							30,
							0,
							"",
							1
						];
					};
				} foreach BIS_fnc_respawnMenuPosition_positions;
			} else {
				_ctrlMap drawrectangle [[0,0],1e5,1e5,0,[0.1,0.1,0.1,1],"#(argb,8,8,3)color(1,1,1,1)"];
			};
		};

		case "mousemoving": {
			_ctrlMap = _this select 0;
			_mX = _this select 1;
			_mY = _this select 2;
			_dis = 0.048;
			_selected = -1;
			{
				_pos = _ctrlMap ctrlmapworldtoscreen (_x call bis_fnc_position);
				if (_pos distance [_mX,_mY] < _dis) then {
					_selected =  _x;
				};
			} foreach BIS_fnc_respawnMenuPosition_positions;
			BIS_fnc_respawnMenuPosition_selected = _selected;
		};
		case "update": {
			_selected = _ctrlList lbdata lbcursel _ctrlList;
			if (_selected == "") then {_selected = missionnamespace getvariable ["BIS_fnc_respawnMenuPosition_respawn",""];};
			_selectedStr = if (typeName _selected != typeName "") then { str _selected } else { _selected };
			_setCurSel = false;

			//--- Preload the selected scene
			if (str _selected != """""") then {
				preloadcamera (_selected call bis_fnc_position);
				if (typename _selected == typename objnull) then {1 preloadobject _selected};
			};

			_respawnPositions = (player call bis_fnc_getRespawnPositions) + ((player call bis_fnc_objectSide) call bis_fnc_getRespawnMarkers);
			_respawnPositionNames = [player,true] call bis_fnc_getRespawnPositions;

			_respawnData = missionnamespace getvariable ["BIS_fnc_respawnMenuPosition_data",[]];
			_respawnPositionsOld = missionnamespace getvariable ["BIS_fnc_respawnMenuPosition_positions",[]];
			//if (count _respawnPositionsOld == 0) then {lbclear _ctrlList;};
			missionnamespace setvariable ["BIS_fnc_respawnMenuPosition_positions",+_respawnPositions];

			//--- Scan existing respawns
			_currentData = [];
			_toRemove = _respawnPositionsOld - _respawnPositions;
			for "_i" from 0 to (lbsize _ctrlList - 1) do {
				_lbData = _ctrlList lbdata _i;

				if (count _toRemove > 0 && {{_lbData == str _x} count _respawnPositions == 0 && _lbData != RANDOM_DATA}) then {
					//--- Remove
					_ctrlList lbdelete _i; //--- Will be deleted at the end of current frame, no need to reindex
					_setCurSel = true;
				} else {
					//--- Refresh picture of soldiers (e.g., when they get in a vehicle)
					_lbValue = _ctrlList lbvalue _i;
					if (_lbValue != RANDOM_VALUE) then {
						if ((_respawnData select abs(_lbValue)) select 1) then {
							_xVeh = vehicle ((_respawnData select abs(_lbValue)) select 0);
							_ctrlList lbsetpicture [_i,gettext (configfile >> "cfgvehicles" >> typeof _xVeh >> "icon") call bis_fnc_textureVehicleIcon];
						};
					};
					_currentData pushback _lbData;
				};

				private "_pos";
				_pos = [0, 0, 0];

				{
					if (_lbData == str _x && {_lbData != RANDOM_DATA}) then
					{
						_pos = _x;
					};
				} forEach _respawnPositions;

				_pos = switch (typeName _pos) do
				{
					case (typeName "") : { getMarkerPos _pos; };
					case (typeName objNull) : { _pos; };
					case (typeName []) : { _pos; };
					default { [0,0,0] };
				};

				// Warning whether enemy is nearby selected position
				if (_lbData != RANDOM_DATA && {{ alive _x && {side group _x != side group player} && {_x distance _pos <= 100} } count allUnits > 0}) then
				{
					private "_color";
					_color = ["IGUI", "WARNING_RGB"] call bis_fnc_displayColorGet;
					_color set [3, 1];

					_ctrlList lbSetTooltip [_i, localize "STR_A3_bis_fnc_respawnmenuposition_warning"];
					_ctrlList lbSetTextRight [_i, "[!]"];
					_ctrlList lbSetColorRight [_i, _color];
				}
				else
				{
					_ctrlList lbSetTooltip [_i, ""];
					_ctrlList lbSetTextRight [_i, ""];
				};
			};

			//--- Add new respawns
			_toAdd = _respawnPositions - _respawnPositionsOld;
			if (count _toAdd > 0) then {
				{
					_xStr = str _x;
					if !(_xStr in _currentData) then {
						_index = count _respawnData;
						_text = "";
						_picture = "";
						_refresh = false;
						_canAdd = true;
						switch (typename _x) do {
							case (typename ""): {
								_text = markertext _x;
								_picture = if (markertype _x == "empty") then {""} else {(markertype _x) call bis_fnc_textureMarker};
							};
							case (typename grpnull);
							case (typename objnull): {
								if (typename _x == typename grpnull) then {_x = leader _x;};
								if !(isnull _x) then {
									//_xStr = _x call bis_fnc_objectvar;
									_xVeh = vehicle _x;
									_text = (_respawnPositionNames select (_respawnPositions find _x)) param [0,"",[""]];
									if (_xVeh iskindof "allvehicles") then {
										if (_text == "") then {
											_text = name _x;
											if (isnull group _x) then {
												_text = gettext (configfile >> "cfgvehicles" >> typeof _xVeh >> "displayName");
											} else {
												if (isplayer _x) then {
													_index = -_index; //--- Prioritize list sorting
												} else {
													_text = format ["%1: %2",localize "str_player_ai",_text]
												};
												_refresh = side group _x != sidelogic;
											};
										};
										_picture = gettext (configfile >> "cfgvehicles" >> typeof _xVeh >> "icon") call bis_fnc_textureVehicleIcon;
									};
								} else {
									_canAdd = false;
								};
							};
							case (typename []): {
								_text = _respawnPositionNames select (_respawnPositions find _x);
							};
						};
						if (_canAdd) then {
							_xPos = _x call bis_fnc_position;
							if (isnil "_text" || {_text == ""}) then {_text = _xPos call bis_fnc_locationdescription;};
							//if (_text == "") then {_text = _xPos call bis_fnc_locationdescription;};
							if (_picture == "") then {
								_picture = if ((_xPos select 2) > 20) then {"respawn_para" call bis_fnc_texturemarker} else {"respawn_inf" call bis_fnc_texturemarker};
							};
							_respawnData pushback [_x,_refresh];

							_lbAdd = _ctrlList lbadd _text;
							_ctrlList lbsetvalue [_lbAdd,_index];
							_ctrlList lbsetdata [_lbAdd,_xStr];
							_ctrlList lbsetpicture [_lbAdd,_picture];
							_setCurSel = true;
						};


					};
				} foreach (_respawnPositions - _respawnPositionsOld);
				missionnamespace setvariable ["BIS_fnc_respawnMenuPosition_data",+_respawnData];
			};

			if (_setCurSel) then {
				//--- If there are more then 1 respawn positions available, we show random option
				//--- Otherwise, delete random if in the list
				if (count _respawnPositions > 1) then {
					if (_ctrlList lbdata 0 != RANDOM_DATA) then {
						_lbAdd = _ctrlList lbAdd format ["<%1>",localize "STR_A3_BIS_fnc_respawnMenuPosition_random"];
						_ctrlList lbsetvalue [_lbAdd,RANDOM_VALUE];
						_ctrlList lbsetdata [_lbAdd,RANDOM_DATA];
					};
				} else {
					if (_ctrlList lbdata 0 == RANDOM_DATA) then {_ctrlList lbdelete 0;};
				};

				//--- Sort list by value
				lbsortbyvalue _ctrlList;

				//--- Select previously selected item if found, otherwise, do not select any
				_cursel = -1;

				//--- First update select first available position
				if (isNil {missionNamespace getVariable "BIS_fnc_respawnMenuPosition_respawn"}) then {
					_cursel = 0;
				} else {
					for "_i" from 0 to (lbsize _ctrlList - 1) do {
						_lbData = _ctrlList lbdata _i;
						if (_lbData isEqualTo _selectedStr) then {_cursel = _i;};
					};
				};

				//--- Select the previous item, or none if previous does not exist anymore
				_ctrlList lbsetcursel _cursel;
				[objnull,"select"] call bis_fnc_respawnMenuposition;

				//--- Show warning when no positions are available
				_showWarning = count _respawnPositions == 0;
				if !(ctrlshown _ctrlContentGroup isequalto _showWarning) then {
					_ctrlContentGroup ctrlshow _showWarning;
					_ctrlContentBackground ctrlshow _showWarning;
				};
			};

			//--- Black in empty list
			if (lbsize _ctrlList == 0 && {ctrlfade _ctrlBlackContent == 0}) then {
				_ctrlBlackContent ctrlsetfade 1;
				_ctrlBlackContent ctrlcommit 0.2;
			};
		};
		case "mousebuttondown": {
			_ctrlMap = _this select 0;
			_button = _this select 1;
			if (_button == 0) then {
				_display = ctrlparent _ctrlMap;
				_ctrlList = _display displayctrl BIS_fnc_respawnMenuPosition_ctrlList;
				for "_i" from 0 to (lbsize _ctrlList - 1) do {
					if (str BIS_fnc_respawnMenuPosition_selected == _ctrlList lbdata _i) then {
						BIS_fnc_respawnMenuPosition_systemSelect = true;
						BIS_fnc_respawnMenuPosition_respawn = BIS_fnc_respawnMenuPosition_selected;
						_ctrlList lbsetcursel _i;
					};
				};
			};
		};
		case "select": {
			with missionnamespace do {
				if (lbsize _ctrlList == 0 || {missionNamespace getVariable ["BIS_fnc_respawnMenuPosition_systemSelect",false]}) exitwith {BIS_fnc_respawnMenuPosition_systemSelect = false;};
				_value = _ctrlList lbvalue lbcursel _ctrlList;
				_commitTime = missionnamespace getvariable ["BIS_fnc_respawnMenuPosition_commitTime",0];
				if (_value != RANDOM_VALUE && lbcursel _ctrlList != -1) then {
					//--- Specific
					_respawnData = missionnamespace getvariable ["BIS_fnc_respawnMenuPosition_data",[]];
					_respawn = (_respawnData select abs(_value)) select 0;
					_position = _respawn call bis_fnc_position;
					_ctrlMap ctrlmapanimadd [_commitTime,ctrlmapscale _ctrlMap,_position call bis_fnc_position];
					ctrlmapanimcommit _ctrlMap;
					BIS_fnc_respawnMenuPosition_respawn = _respawn;
				} else {
					//--- Random
					_respawnPositions = missionnamespace getvariable ["BIS_fnc_respawnMenuPosition_positions",[]];
					if (count _respawnPositions > 0) then {
						_posXmin = 1e10;
						_posXmax = 0;
						_posYmin = 1e10;
						_posYmax = 0;
						{
							_xPos = _x call bis_fnc_position;
							_posXmin = _posXmin min (_xPos select 0);
							_posXmax = _posXmax max (_xPos select 0);
							_posYmin = _posYmin min (_xPos select 1);
							_posYmax = _posYmax max (_xPos select 1);
						} foreach _respawnPositions;
						_posW =  _posXmax - _posXmin;
						_posH = _posYmax - _posYmin;
						_posX = _posXmin + _posW / 2;
						_posY = _posYmin + _posH / 2;

						_mapPosMax = _ctrlMap ctrlmapworldtoscreen [_posXmax,_posYmax];
						_mapPosMin = _ctrlMap ctrlmapworldtoscreen [_posXmin,_posYmin];
						_mapPosW = ((_mapPosMax select 0) - (_mapPosMin select 0));
						_mapPosH = ((_mapPosMin select 1) - (_mapPosMax select 1));
						_mapZoom = if (_mapPosW > 0 && _mapPosH > 0) then {
							_mapScale = ctrlmapscale _ctrlMap;
							_mapScaleW = _mapScale / ((ctrlposition _ctrlMap select 2) / _mapPosW);
							_mapScaleH = _mapScale / ((ctrlposition _ctrlMap select 3) / _mapPosH);
							(_mapScaleW max _mapScaleH) * 2
						} else {
							ctrlmapscale _ctrlMap
						};

						_ctrlMap ctrlmapanimadd [_commitTime,_mapZoom,[_posX,_posY]];
						ctrlmapanimcommit _ctrlMap;
					};
					BIS_fnc_respawnMenuPosition_respawn = "";
				};
				BIS_fnc_respawnMenuPosition_commitTime = 0.2;
				_ctrlBlackContent ctrlsetfade 1;
				_ctrlBlackContent ctrlcommit 0.2;
			};
		};
	};
} else {
	_respawnDelay = _this param [3,0,[0]];
	_revive = _this param [4, false, [false]];

	// Revive will handle template execution
	if (([] call BIS_fnc_reviveEnabled) && !(_revive)) exitWith {};

	disableserialization;

	if (!alive _unit) then {
		if (playerrespawntime < 1 || !isplayer _unit) exitwith {};
		if (simulationenabled _unit) then {
			if (playerrespawntime < 3) then {setplayerrespawntime (playerrespawntime + 3);};

			waitUntil {sleep 0.5; playerrespawntime < 5};

			sleep 1.9;
			cutText ["","black out",0.5];
			sleep 1;
			cutText ["","black in"];
		};

		///////////////////////////////////////////////////////////////////////////////////////////
		//--- onPlayerKilled
		///////////////////////////////////////////////////////////////////////////////////////////

		[
			"Select Respawn Point",
			{
				scriptname "BIS_fnc_respawnMenuPosition";
				_fnc_scriptName = "BIS_fnc_respawnMenuPosition";
				disableserialization;
				_mode = _this select 0;
				_ctrlListBackground = _this select 1;
				_ctrlList = _this select 2;
				_ctrlContentBackground = _this select 3;
				_ctrlContentGroup = _this select 4;
				_ctrlContent = _this select 5;
				_ctrlMap = _this select 6;
				_ctrlBlackContent = _this select 7;

				switch _mode do {
					case "init": {
						_ctrlContent ctrlenable false;
						_ctrlContentBackground ctrlenable false;
						_ctrlContentGroup ctrlenable false;
						_ctrlContentGroup ctrlshow false;
						_ctrlMap ctrlshow true;

						with missionnamespace do {
							BIS_fnc_respawnMenuPosition_ctrlList = ctrlIDC _ctrlList;
							BIS_fnc_respawnMenuPosition_selected = -1;
							BIS_fnc_respawnMenuPosition_positions = [];
							BIS_fnc_respawnMenuPosition_systemSelect = true;
							BIS_fnc_respawnMenuPosition_commitTime = 0;
						};

						_ctrlMap ctrladdeventhandler ["draw",{[objnull,"draw",_this] call BIS_fnc_respawnMenuPosition;}];
						_ctrlMap ctrladdeventhandler ["mouseMoving",{[objnull,"mousemoving",_this] call BIS_fnc_respawnMenuPosition;}];
						_ctrlMap ctrladdeventhandler ["mouseHolding",{[objnull,"mousemoving",_this] call BIS_fnc_respawnMenuPosition;}];
						_ctrlMap ctrladdeventhandler ["mouseButtonDown",{[objnull,"mousebuttondown",_this] call BIS_fnc_respawnMenuPosition;}];

						//--- Default map position
						_mapSize = [] call bis_fnc_mapSize;
						_ctrlMap ctrlmapanimadd [0,0.1,[_mapSize * 0.5,_mapSize * 0.5]];
						ctrlmapanimcommit _ctrlMap;

						//--- Warning message about no positions (hidden by default)
						_ctrlContentGroup ctrlshow true;
						_ctrlContent ctrlsetstructuredtext parsetext format [
							"<t size='1.5' align='center'>%1</t>",
							(missionnamespace getvariable ["BIS_fnc_respawnMenuPosition_text",toupper "No respawn positions available"]) //--- ToDo: Localize
						];

						_h = _ctrlContent call bis_fnc_ctrlFitToTextHeight;
						_ctrlContentGroupPos = ctrlposition _ctrlContentGroup;
						_ctrlContentGroupPos set [1,(_ctrlContentGroupPos select 1) + (_ctrlContentGroupPos select 3) * 0.5 - _h * 0.5];
						_ctrlContentGroupPos set [3,_h];
						_ctrlContentGroup ctrlsetposition _ctrlContentGroupPos;
						_ctrlContentGroup ctrlcommit 0;
						_ctrlContentGroup ctrlshow true;

						_ctrlContentBackground ctrlsetposition _ctrlContentGroupPos;
						_ctrlContentBackground ctrlcommit 0;
						_ctrlContentBackground ctrlshow true;

						_ctrlBlackContent ctrlsetfade 1;
						_ctrlBlackContent ctrlcommit 0;
					};
					case "select": {
						if (lbcursel _ctrlList >= 0) then {[objnull,"select"] call bis_fnc_respawnMenuposition;};
					};
					case "update": {
						[objnull,"update"] call bis_fnc_respawnMenuposition;
					};
				};
			}
		] call bis_fnc_showRespawnMenu;
	} else {

		///////////////////////////////////////////////////////////////////////////////////////////
		//--- onPlayerRespawn
		///////////////////////////////////////////////////////////////////////////////////////////
		if (isplayer _unit) then {
			["bis_fnc_respawnMenuPosition","RscDisplayLoadingBlack"] call bis_fnc_startloadingscreen;

			//--- Player - teleport to selected position
			[] call bis_fnc_showRespawnMenu;

			_respawn = missionnamespace getvariable ["BIS_fnc_respawnMenuPosition_respawn",""];
			if (str _respawn == """""") then {
				_positions = ((player call bis_fnc_objectSide) call bis_fnc_getRespawnMarkers) + (player call bis_fnc_getRespawnPositions);
				_respawn = if (count _positions > 0) then {
					_positions call bis_fnc_selectrandom;
				} else {
					nil
				};
			};

			if (isnil "_respawn") then {
				["Cannot respawn %1, no %2 respawn position found.",_unit,_unit call bis_fnc_objectSide] call bis_fnc_error;
			} else {
				[_unit,_respawn] call bis_fnc_moveToRespawnPosition;
			};

			//--- Clean-up
			BIS_fnc_respawnMenuPosition_draw = nil;
			BIS_fnc_respawnMenuPosition_mouseMoving = nil;
			BIS_fnc_respawnMenuPosition_mouseButtonClick = nil;
			BIS_fnc_respawnMenuPosition_systemSelect = nil;
			BIS_fnc_respawnMenuPosition_positions = nil;
			BIS_fnc_respawnMenuPosition_commitTime = nil;
			with uinamespace do {
				BIS_fnc_respawnMenuPosition_ctrlList = nil;
				BIS_fnc_respawnMenuPosition_positions = nil
			};

			setplayerrespawntime _respawnDelay;

			"bis_fnc_respawnMenuPosition" call bis_fnc_endloadingscreen;
		} else {

			//--- AI - teleport to random position
			_respawnPositions = ((_unit call bis_fnc_objectSide) call bis_fnc_getRespawnMarkers) + (_unit call bis_fnc_getRespawnPositions);
			if (count _respawnPositions > 0) then {
				_respawn = _respawnPositions call bis_fnc_selectrandom;
				[_unit,_respawn] call bis_fnc_moveToRespawnPosition;
			};
		};
	};
};