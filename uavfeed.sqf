params ["_screen", "_vehicle", "_r2tName"];

_screen setObjectTexture [0, format ["#(argb,512,512,1)r2t(%1,1)", _r2tName]];

/* create camera and stream to render surface */
private _cam = "camera" camCreate [0,0,0];
_cam cameraEffect ["Internal", "Back", _r2tName];

/* attach cam to gunner cam position */
_cam attachTo [_vehicle, [0,0,0], "PiP0_pos"];

/* make it zoom in a little */
_cam camSetFov 0.1;

/* switch cam to thermal */
_r2tName setPiPEffect [0];

/* adjust cam orientation */
addMissionEventHandler ["Draw3D", {
    _dir = 
        (_vehicle selectionPosition "PiP0_pos") 
            vectorFromTo 
        (_vehicle selectionPosition "PiP0_dir");
    _cam setVectorDirAndUp [
        _dir, 
        _dir vectorCrossProduct [-(_dir select 1), _dir select 0, 0]
    ];
}];
