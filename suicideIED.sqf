params ["_unit"];

[_unit, "Allahuakbar"] remoteExec ["say3D", -2, false];

[_unit] spawn {
  params ["_unit"];

  sleep 2;

  if (alive _unit) then {
    "R_60mm_HE" createVehicle getPos _unit;
  };
};