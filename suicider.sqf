params ["_suicider"];

private _pos = getPos _suicider;

private _expl1 = "DemoCharge_Remote_Ammo" createVehicle _pos;
_expl1 attachTo [_suicider, [-0.1,0.1,0.15],"Pelvis"];
private _expl2 = "DemoCharge_Remote_Ammo" createVehicle _pos;
_expl2 attachTo [_suicider, [0,0.15,0.15],"Pelvis"];
private _expl3 = "DemoCharge_Remote_Ammo" createVehicle _pos;
_expl3 attachTo [_suicider, [0.1,0.1,0.15],"Pelvis"];

[[_expl1,_expl2,_expl3], {
    (_this select 0) setVectorDirAndUp [[0.5,0.5,0],[-0.5,0.5,0]];
    (_this select 1) setVectorDirAndUp [[1,0,0],[0,1,0]];
    (_this select 2) setVectorDirAndUp [[0.5,-0.5,0],[0.5,0.5,0]];
}] remoteExec ["call", 0, false];