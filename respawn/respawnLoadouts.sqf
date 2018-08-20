switch (typeof player) do {


//Befattning vs klassnamn

//Plutonchef = "B_officer_F"
//PlutonsSJV =  "B_medic_F"
//JTAC HKP = "B_soldier_UAV_F"

//Gruppchef = "B_Soldier_SL_F"
//Stf GB = "B_Soldier_TL_F"

//KSP90 Skytt = "B_soldier_AR_F"
//KSP58 Skytt = "B_HeavyGunner_F"
//KSP 58 Ladd = "B_support_AMG_F"
//Skarpskytt = "B_soldier_M_F"
//Prickskytt = "B_Sharpshooter_F"
//Rb57 Skytt = "B_soldier_LAT_F"
//Ak5/P-Skott = "B_Soldier_F"
//CLS = "TF47_B_soldier_AT4HEAT"

//GRG M/86 skyttt = "B_soldier_AT_F"
//GRG M/86 ladd = "B_soldier_AAT_F"

//Ingenjör offensiv = "B_soldier_exp_F"
//Helikoperpilot = "B_Helipilot_F"
//Helikoperspecialist = "B_helicrew_F"



	// PlutonChef
	case  "B_officer_F" : {
		comment "Exported from Arsenal by Kingtiger";

		comment "Remove existing items";
		removeAllWeapons player;
		removeAllItems player;
		removeAllAssignedItems player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeHeadgear player;

		comment "Add containers";
		player forceAddUniform "CUP_U_B_BAF_MTP_S6_UnRolled";
		player addItemToUniform "ACE_EarPlugs";
		player addItemToUniform "ACE_Flashlight_MX991";
		player addItemToUniform "ACE_MapTools";
		player addItemToUniform "ACE_EntrenchingTool";
		player addItemToUniform "ACE_IR_Strobe_Item";
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_tourniquet";};
		for "_i" from 1 to 4 do {player addItemToUniform "ACE_elasticBandage";};
		for "_i" from 1 to 6 do {player addItemToUniform "ACE_quikclot";};
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_packingBandage";};
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_morphine";};
		player addItemToUniform "ACE_personalAidKit";
		
		player addVest "CUP_V_BAF_Osprey_Mk4_MTP_SquadLeader";
		for "_i" from 1 to 5 do {player addItemToVest "CUP_30Rnd_556x45_Stanag";};
		for "_i" from 1 to 2 do {player addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";};
		for "_i" from 1 to 2 do {player addItemToVest "CUP_HandGrenade_L109A1_HE";};
		for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
		for "_i" from 1 to 2 do {player addItemToVest "CUP_17Rnd_9x19_glock17";};
		player addItemToVest "SmokeShellOrange";
		player addItemToVest "SmokeShellPurple";
		player addItemToVest "SmokeShellRed";
		
		
		player addBackpack "tf_rt1523g_big";
		player addHeadgear "CUP_H_BAF_Helmet_Net_2_MTP";
		player addGoggles "sam_peltor_bronze";
		player addItemToUniform "ACE_EntrenchingTool";

		comment "Add weapons";
		player addWeapon "CUP_arifle_L85A2_G";
		player addPrimaryWeaponItem "CUP_acc_LLM";
		player addPrimaryWeaponItem "CUP_optic_ACOG";
		player addWeapon "CUP_hgun_Glock17_blk";
		player addWeapon "Binocular";

		comment "Add items";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
		player linkItem "ItemRadio";
		player linkItem "ItemGPS";
		player linkItem "CUP_NVG_HMNVS";

		comment "Set identity";
		[player,"SAM_SAF"] call bis_fnc_setUnitInsignia;
	};
	
	// PlutonsSJV
	case  "B_medic_F" : {
		comment "Exported from Arsenal by Kingtiger";

		comment "Remove existing items";
		removeAllWeapons player;
		removeAllItems player;
		removeAllAssignedItems player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeHeadgear player;

		comment "Add containers";
		player forceAddUniform "CUP_U_B_BAF_MTP_S1_RolledUp";
		player addItemToUniform "ACE_EarPlugs";
		player addItemToUniform "ACE_Flashlight_MX991";
		player addItemToUniform "ACE_MapTools";
		player addItemToUniform "ACE_EntrenchingTool";
		player addItemToUniform "ACE_IR_Strobe_Item";
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_tourniquet";};
		for "_i" from 1 to 4 do {player addItemToUniform "ACE_elasticBandage";};
		for "_i" from 1 to 6 do {player addItemToUniform "ACE_quikclot";};
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_packingBandage";};
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_morphine";};
		player addItemToUniform "ACE_personalAidKit";
		
		player addVest "CUP_V_BAF_Osprey_Mk4_MTP_Grenadier";
		for "_i" from 1 to 5 do {player addItemToVest "CUP_30Rnd_556x45_Stanag";};
		for "_i" from 1 to 2 do {player addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";};
		for "_i" from 1 to 2 do {player addItemToVest "CUP_HandGrenade_L109A1_HE";};
		for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
		for "_i" from 1 to 2 do {player addItemToVest "CUP_17Rnd_9x19_glock17";};
		
		player addBackpack "B_Kitbag_mcamo";
		for "_i" from 1 to 6 do {player addItemToBackpack "ACE_tourniquet";};
		for "_i" from 1 to 20 do {player addItemToBackpack "ACE_fieldDressing";};
		for "_i" from 1 to 20 do {player addItemToBackpack "ACE_elasticBandage";};
		for "_i" from 1 to 20 do {player addItemToBackpack "ACE_quikclot";};
		for "_i" from 1 to 20 do {player addItemToBackpack "ACE_packingBandage";};
		for "_i" from 1 to 15 do {player addItemToBackpack "ACE_morphine";};
		for "_i" from 1 to 15 do {player addItemToBackpack "ACE_epinephrine";};
		for "_i" from 1 to 4 do {player addItemToBackpack "ACE_bloodIV";};
		for "_i" from 1 to 4 do {player addItemToBackpack "ACE_bloodIV_500";};
		for "_i" from 1 to 10 do {player addItemToBackpack "ACE_personalAidKit";};
		for "_i" from 1 to 2 do {player addItemToBackpack "ACE_bodyBag";};
		
		player addHeadgear "CUP_H_BAF_Helmet_Net_2_MTP";
		player addGoggles "sam_peltor_bronze";
		

		comment "Add weapons";
		player addWeapon "CUP_arifle_L85A2_G";
		player addPrimaryWeaponItem "CUP_acc_LLM";
		player addPrimaryWeaponItem "CUP_optic_ACOG";
		player addWeapon "CUP_hgun_Glock17_blk";

		comment "Add items";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
		player linkItem "ItemRadio";
		player linkItem "ItemGPS";
		player linkItem "CUP_NVG_HMNVS";

		comment "Set identity";
		[player,"ACE_insignia_banana"] call bis_fnc_setUnitInsignia;
	};
	
	// JTAC HKP
	case  "B_soldier_UAV_F" : {
		comment "Exported from Arsenal by Kingtiger";

		comment "Remove existing items";
		removeAllWeapons player;
		removeAllItems player;
		removeAllAssignedItems player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeHeadgear player;

		comment "Add containers";
		player forceAddUniform "CUP_U_B_BAF_MTP_S3_RolledUp";
		player addItemToUniform "ACE_EarPlugs";
		player addItemToUniform "ACE_Flashlight_MX991";
		player addItemToUniform "ACE_MapTools";
		player addItemToUniform "ACE_EntrenchingTool";
		player addItemToUniform "ACE_IR_Strobe_Item";
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_tourniquet";};
		for "_i" from 1 to 4 do {player addItemToUniform "ACE_elasticBandage";};
		for "_i" from 1 to 6 do {player addItemToUniform "ACE_quikclot";};
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_packingBandage";};
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_morphine";};
		player addItemToUniform "ACE_personalAidKit";
		
		
		player addVest "CUP_V_BAF_Osprey_Mk4_MTP_Grenadier";
		for "_i" from 1 to 2 do {player addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";};
		for "_i" from 1 to 4 do {player addItemToVest "CUP_30Rnd_556x45_Stanag";};
		for "_i" from 1 to 2 do {player addItemToVest "CUP_HandGrenade_L109A1_HE";};
		for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
		player addItemToVest "B_IR_Grenade";
		for "_i" from 1 to 3 do {player addItemToVest "SmokeShellOrange";};
		for "_i" from 1 to 3 do {player addItemToVest "SmokeShellPurple";};
		for "_i" from 1 to 3 do {player addItemToVest "SmokeShellRed";};
		for "_i" from 1 to 2 do {player addItemToVest "Laserbatteries";};
		
		player addBackpack "tf_rt1523g_big";
		
		player addHeadgear "CUP_H_BAF_Helmet_4_MTP";
		player addGoggles "sam_peltor_bronze";
		

		comment "Add weapons";
		player addWeapon "CUP_arifle_L85A2_G";
		player addPrimaryWeaponItem "CUP_acc_LLM";
		player addPrimaryWeaponItem "CUP_optic_ACOG";
		player addWeapon "CUP_hgun_Glock17_blk";
		player addWeapon "Laserdesignator_03";

		comment "Add items";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
		player linkItem "ItemRadio";
		player linkItem "ItemGPS";
		player linkItem "CUP_NVG_HMNVS";

		comment "Set identity";
		[player,"SAM_SAF"] call bis_fnc_setUnitInsignia;
	};	
	
	// Gruppchef
	case  "B_Soldier_SL_F" : {
		comment "Exported from Arsenal by Kingtiger";

		comment "Remove existing items";
		removeAllWeapons player;
		removeAllItems player;
		removeAllAssignedItems player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeHeadgear player;

		comment "Add containers";
		player forceAddUniform "CUP_U_B_BAF_MTP_S3_RolledUp";
		player addItemToUniform "ACE_EarPlugs";
		player addItemToUniform "ACE_Flashlight_MX991";
		player addItemToUniform "ACE_MapTools";
		player addItemToUniform "ACE_EntrenchingTool";
		player addItemToUniform "ACE_IR_Strobe_Item";
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_tourniquet";};
		for "_i" from 1 to 4 do {player addItemToUniform "ACE_elasticBandage";};
		for "_i" from 1 to 6 do {player addItemToUniform "ACE_quikclot";};
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_packingBandage";};
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_morphine";};
		player addItemToUniform "ACE_personalAidKit";
		
		player addVest "CUP_V_BAF_Osprey_Mk4_MTP_SquadLeader";
		for "_i" from 1 to 5 do {player addItemToVest "CUP_30Rnd_556x45_Stanag";};
		for "_i" from 1 to 3 do {player addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";};
		for "_i" from 1 to 2 do {player addItemToVest "CUP_HandGrenade_L109A1_HE";};
		for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
		player addItemToVest "SmokeShellBlue";
		player addItemToVest "SmokeShellOrange";
		for "_i" from 1 to 2 do {player addItemToVest "CUP_17Rnd_9x19_glock17";};
		
		player addBackpack "tf_rt1523g_big";
		player addHeadgear "CUP_H_BAF_Helmet_Net_2_MTP";
		player addGoggles "sam_peltor_bronze";
		

		comment "Add weapons";
		player addWeapon "CUP_arifle_L85A2_G";
		player addPrimaryWeaponItem "CUP_acc_LLM";
		player addPrimaryWeaponItem "CUP_optic_ACOG";
		player addWeapon "CUP_hgun_Glock17_blk";
		player addWeapon "Binocular";

		comment "Add items";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
		player linkItem "ItemRadio";
		player linkItem "ItemGPS";
		player linkItem "CUP_NVG_HMNVS";

		comment "Set identity";
		[player,"SAM_SAF"] call bis_fnc_setUnitInsignia;
	};
	
	// Stf GB 
	case  "B_Soldier_TL_F" : {
		comment "Exported from Arsenal by Kingtiger";

		comment "Remove existing items";
		removeAllWeapons player;
		removeAllItems player;
		removeAllAssignedItems player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeHeadgear player;

		comment "Add containers";
		player forceAddUniform "CUP_U_B_BAF_MTP_S6_UnRolled";
		player addItemToUniform "ACE_EarPlugs";
		player addItemToUniform "ACE_Flashlight_MX991";
		player addItemToUniform "ACE_MapTools";
		player addItemToUniform "ACE_EntrenchingTool";
		player addItemToUniform "ACE_IR_Strobe_Item";
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_tourniquet";};
		for "_i" from 1 to 4 do {player addItemToUniform "ACE_elasticBandage";};
		for "_i" from 1 to 6 do {player addItemToUniform "ACE_quikclot";};
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_packingBandage";};
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_morphine";};
		player addItemToUniform "ACE_personalAidKit";
		
		player addVest "CUP_V_BAF_Osprey_Mk4_MTP_SquadLeader";
		for "_i" from 1 to 5 do {player addItemToVest "CUP_30Rnd_556x45_Stanag";};
		for "_i" from 1 to 3 do {player addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";};
		for "_i" from 1 to 2 do {player addItemToVest "CUP_HandGrenade_L109A1_HE";};
		for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
		for "_i" from 1 to 2 do {player addItemToVest "CUP_17Rnd_9x19_glock17";};
		
		player addItemToVest "SmokeShellBlue";
		player addItemToVest "SmokeShellOrange";
		
		player addBackpack "tf_rt1523g_big";
		for "_i" from 1 to 11 do {player addItemToBackpack "1Rnd_HE_Grenade_shell";};
		for "_i" from 1 to 4 do {player addItemToBackpack "1Rnd_SmokeRed_Grenade_shell";};
		for "_i" from 1 to 4 do {player addItemToBackpack "1Rnd_SmokeBlue_Grenade_shell";};
		
		
		player addHeadgear "CUP_H_BAF_Helmet_1_MTP";
		player addGoggles "sam_peltor_bronze";
		

		comment "Add weapons";
		player addWeapon "CUP_arifle_L85A2_GL";
		player addPrimaryWeaponItem "CUP_acc_LLM";
		player addPrimaryWeaponItem "CUP_optic_ACOG";
		player addWeapon "CUP_hgun_Glock17_blk";

		comment "Add items";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
		player linkItem "ItemRadio";
		player linkItem "ItemGPS";
		player linkItem "CUP_NVG_HMNVS";

		comment "Set identity";
		[player,"SAM_SAF"] call bis_fnc_setUnitInsignia;
	};
	
	// KSP90 Skytt
	case  "B_soldier_AR_F" : {
		comment "Exported from Arsenal by Kingtiger";

		comment "Remove existing items";
		removeAllWeapons player;
		removeAllItems player;
		removeAllAssignedItems player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeHeadgear player;

		comment "Add containers";
		player forceAddUniform "CUP_U_B_BAF_MTP_S6_UnRolled";
		player addItemToUniform "ACE_EarPlugs";
		player addItemToUniform "ACE_Flashlight_MX991";
		player addItemToUniform "ACE_MapTools";
		player addItemToUniform "ACE_EntrenchingTool";
		player addItemToUniform "ACE_IR_Strobe_Item";
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_tourniquet";};
		for "_i" from 1 to 4 do {player addItemToUniform "ACE_elasticBandage";};
		for "_i" from 1 to 6 do {player addItemToUniform "ACE_quikclot";};
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_packingBandage";};
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_morphine";};
		player addItemToUniform "ACE_personalAidKit";
		
		
		player addVest "CUP_V_BAF_Osprey_Mk4_MTP_MachineGunner";
		for "_i" from 1 to 2 do {player addItemToVest "CUP_200Rnd_TE4_Red_Tracer_556x45_M249";};
		for "_i" from 1 to 2 do {player addItemToVest "CUP_HandGrenade_L109A1_HE";};
		for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
		
		player addBackpack "B_Kitbag_mcamo";
		for "_i" from 1 to 2 do {player addItemToBackpack "CUP_200Rnd_TE4_Red_Tracer_556x45_M249";};
		player addHeadgear "CUP_H_BAF_Helmet_4_MTP";
		player addGoggles "sam_peltor_bronze";
		

		comment "Add weapons";
		player addWeapon "CUP_lmg_L110A1";
		player addPrimaryWeaponItem "CUP_acc_LLM";
		player addPrimaryWeaponItem "CUP_optic_ACOG";

		comment "Add items";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
		player linkItem "ItemRadio";
		player linkItem "ItemGPS";
		player linkItem "CUP_NVG_HMNVS";

		comment "Set identity";
		[player,"SAM_SAF"] call bis_fnc_setUnitInsignia;
	};
	
	// KSP58 Skytt
	case  "B_HeavyGunner_F" : {
		comment "Exported from Arsenal by Kingtiger";

		comment "Remove existing items";
		removeAllWeapons player;
		removeAllItems player;
		removeAllAssignedItems player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeHeadgear player;

		comment "Add containers";
		player forceAddUniform "CUP_U_B_BAF_MTP_S6_UnRolled";
		player addItemToUniform "ACE_EarPlugs";
		player addItemToUniform "ACE_Flashlight_MX991";
		player addItemToUniform "ACE_MapTools";
		player addItemToUniform "ACE_EntrenchingTool";
		player addItemToUniform "ACE_IR_Strobe_Item";
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_tourniquet";};
		for "_i" from 1 to 4 do {player addItemToUniform "ACE_elasticBandage";};
		for "_i" from 1 to 6 do {player addItemToUniform "ACE_quikclot";};
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_packingBandage";};
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_morphine";};
		player addItemToUniform "ACE_personalAidKit";
		
		
		player addVest "CUP_V_BAF_Osprey_Mk4_MTP_MachineGunner";
		for "_i" from 1 to 2 do {player addItemToVest "CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M";};
		for "_i" from 1 to 2 do {player addItemToVest "CUP_HandGrenade_L109A1_HE";};
		for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
		
		player addBackpack "B_Kitbag_mcamo";
		for "_i" from 1 to 2 do {player addItemToBackpack "CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M";};
		player addHeadgear "CUP_H_BAF_Helmet_4_MTP";
		player addGoggles "sam_peltor_bronze";

		comment "Add weapons";
		player addWeapon "CUP_lmg_L7A2";

		comment "Add items";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
		player linkItem "ItemRadio";
		player linkItem "ItemGPS";
		player linkItem "CUP_NVG_HMNVS";

		comment "Set identity";
		[player,"SAM_SAF"] call bis_fnc_setUnitInsignia;
	};
	
	// Skarpskytt
	case  "B_soldier_M_F" : {
		comment "Exported from Arsenal by Kingtiger";

		comment "Remove existing items";
		removeAllWeapons player;
		removeAllItems player;
		removeAllAssignedItems player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeHeadgear player;

		comment "Add containers";
		player forceAddUniform "CUP_U_B_BAF_MTP_S6_UnRolled";
		player addItemToUniform "ACE_EarPlugs";
		player addItemToUniform "ACE_Flashlight_MX991";
		player addItemToUniform "ACE_MapTools";
		player addItemToUniform "ACE_EntrenchingTool";
		player addItemToUniform "ACE_IR_Strobe_Item";
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_tourniquet";};
		for "_i" from 1 to 4 do {player addItemToUniform "ACE_elasticBandage";};
		for "_i" from 1 to 6 do {player addItemToUniform "ACE_quikclot";};
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_packingBandage";};
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_morphine";};
		player addItemToUniform "ACE_personalAidKit";
		
		player addVest "CUP_V_BAF_Osprey_Mk4_MTP_MachineGunner";
		for "_i" from 1 to 8 do {player addItemToVest "ACE_20Rnd_762x51_M118LR_Mag";};
		for "_i" from 1 to 2 do {player addItemToVest "ACE_20Rnd_762x51_M993_AP_Mag";};
		for "_i" from 1 to 2 do {player addItemToVest "CUP_HandGrenade_L109A1_HE";};
		for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};    
		player addItemToVest "ACE_RangeCard";
		
		player addBackpack "B_Kitbag_mcamo";
		player addHeadgear "CUP_H_BAF_Helmet_1_MTP";
		player addGoggles "sam_peltor_bronze";
		
		comment "Add weapons";
		player addWeapon "CUP_srifle_L129A1_HG";
		player addPrimaryWeaponItem "CUP_optic_SB_3_12x50_PMII";
		player addPrimaryWeaponItem "CUP_bipod_Harris_1A2_L";
		player addWeapon "CUP_launch_M72A6";

		comment "Add items";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
		player linkItem "ItemRadio";
		player linkItem "ItemGPS";
		player linkItem "CUP_NVG_HMNVS";

		comment "Set identity";
		[player,"SAM_SAF"] call bis_fnc_setUnitInsignia;
	};
	
	// Prickskytt
	case  "B_Sharpshooter_F" : {
		comment "Exported from Arsenal by Kingtiger";

		comment "Remove existing items";
		removeAllWeapons player;
		removeAllItems player;
		removeAllAssignedItems player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeHeadgear player;

		comment "Add containers";
		player forceAddUniform "CUP_U_B_BAF_MTP_S6_UnRolled";
		player addItemToUniform "ACE_EarPlugs";
		player addItemToUniform "ACE_Flashlight_MX991";
		player addItemToUniform "ACE_MapTools";
		player addItemToUniform "ACE_EntrenchingTool";
		player addItemToUniform "ACE_IR_Strobe_Item";
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_tourniquet";};
		for "_i" from 1 to 4 do {player addItemToUniform "ACE_elasticBandage";};
		for "_i" from 1 to 6 do {player addItemToUniform "ACE_quikclot";};
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_packingBandage";};
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_morphine";};
		player addItemToUniform "ACE_personalAidKit";
		
		player addVest "CUP_V_BAF_Osprey_Mk4_MTP_MachineGunner";
		for "_i" from 1 to 8 do {player addItemToVest "CUP_5Rnd_86x70_L115A1";};
		for "_i" from 1 to 2 do {player addItemToVest "CUP_HandGrenade_L109A1_HE";};
		for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};   
		for "_i" from 1 to 2 do {player addItemToVest "CUP_17Rnd_9x19_glock17";};		
		player addItemToVest "ACE_RangeCard";
		player addItemToVest "ACE_Kestrel4500";
		
		player addBackpack "B_Kitbag_mcamo";
		player addHeadgear "CUP_H_BAF_Helmet_1_MTP";
		player addGoggles "sam_peltor_bronze";
		
		comment "Add weapons";
		player addWeapon "CUP_srifle_AWM_des";
		player addPrimaryWeaponItem "CUP_muzzle_snds_AWM";
		player addPrimaryWeaponItem "CUP_optic_SB_3_12x50_PMII";
		player addPrimaryWeaponItem "bipod_01_F_blk";
		player addWeapon "CUP_hgun_Glock17_blk";

		comment "Add items";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
		player linkItem "ItemRadio";
		player linkItem "ItemGPS";
		player linkItem "CUP_NVG_HMNVS";

		comment "Set identity";
		[player,"SAM_SAF"] call bis_fnc_setUnitInsignia;
	};
	
	// Rb57 Skytt
	case  "B_soldier_LAT_F" : {
		comment "Exported from Arsenal by Kingtiger";

		comment "Remove existing items";
		removeAllWeapons player;
		removeAllItems player;
		removeAllAssignedItems player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeHeadgear player;

		comment "Add containers";
		player forceAddUniform "SAM_Crye_M90_uniform";
		player addItemToUniform "ACE_EarPlugs";
		player addItemToUniform "ACE_Flashlight_MX991";
		player addItemToUniform "ACE_MapTools";
		player addItemToUniform "ACE_EntrenchingTool";
		player addItemToUniform "ACE_IR_Strobe_Item";
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_tourniquet";};
		for "_i" from 1 to 4 do {player addItemToUniform "ACE_elasticBandage";};
		for "_i" from 1 to 6 do {player addItemToUniform "ACE_quikclot";};
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_packingBandage";};
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_morphine";};
		player addItemToUniform "ACE_personalAidKit";
		
		player addVest "SAM_PlateCarrier";
		for "_i" from 1 to 6 do {player addItemToVest "CUP_30Rnd_556x45_Stanag";};
		for "_i" from 1 to 2 do {player addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";};
		for "_i" from 1 to 3 do {player addItemToVest "CUP_HandGrenade_L109A1_HE";};
		for "_i" from 1 to 3 do {player addItemToVest "SmokeShell";};
		
		player addBackpack "B_Kitbag_mcamo";
		player addHeadgear "SAM_HelmetIA_M90";
		player addGoggles "sam_peltor_bronze";
		
		comment "Add weapons";
		player addWeapon "SAM_AK5C";
		player addPrimaryWeaponItem "CUP_acc_LLM";
		player addPrimaryWeaponItem "CUP_optic_ACOG";
		player addWeapon "launch_NLAW_F";

		comment "Add items";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
		player linkItem "ItemRadio";
		player linkItem "ItemGPS";
		player linkItem "CUP_NVG_HMNVS";

		comment "Set identity";
		[player,"SAM_SAF"] call bis_fnc_setUnitInsignia;
	};
	
	// CLS 
	case  "TF47_B_soldier_AT4HEAT" : {
		comment "Exported from Arsenal by SageNTitled";

		comment "Remove existing items";
		removeAllWeapons player;
		removeAllItems player;
		removeAllAssignedItems player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeHeadgear player;

		comment "Add containers";
		player forceAddUniform "CUP_U_B_BAF_MTP_Tshirt";
		player addItemToUniform "ACE_EarPlugs";
		player addItemToUniform "ACE_Flashlight_MX991";
		player addItemToUniform "ACE_MapTools";
		player addItemToUniform "ACE_EntrenchingTool";
		player addItemToUniform "ACE_IR_Strobe_Item";
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_tourniquet";};
		for "_i" from 1 to 4 do {player addItemToUniform "ACE_elasticBandage";};
		for "_i" from 1 to 6 do {player addItemToUniform "ACE_quikclot";};
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_packingBandage";};
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_morphine";};
		player addItemToUniform "ACE_personalAidKit";
		
		player addVest "CUP_V_BAF_Osprey_Mk4_MTP_Grenadier";
		for "_i" from 1 to 6 do {player addItemToVest "CUP_30Rnd_556x45_Stanag";};
		for "_i" from 1 to 2 do {player addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";};
		for "_i" from 1 to 2 do {player addItemToVest "CUP_HandGrenade_L109A1_HE";};
		for "_i" from 1 to 4 do {player addItemToVest "SmokeShell";};
		player addItemToVest "SmokeShellBlue";
		player addItemToVest "SmokeShellOrange";
		player addItemToVest "SmokeShellPurple";
		
		player addBackpack "B_Kitbag_mcamo";
		for "_i" from 1 to 6 do {player addItemToBackpack "ACE_tourniquet";};
		for "_i" from 1 to 24 do {player addItemToBackpack "ACE_fieldDressing";};
		for "_i" from 1 to 24 do {player addItemToBackpack "ACE_elasticBandage";};
		for "_i" from 1 to 24 do {player addItemToBackpack "ACE_packingBandage";};
		for "_i" from 1 to 24 do {player addItemToBackpack "ACE_quikclot";};
		for "_i" from 1 to 20 do {player addItemToBackpack "ACE_morphine";};
		for "_i" from 1 to 10 do {player addItemToBackpack "ACE_epinephrine";};
		for "_i" from 1 to 4 do {player addItemToBackpack "ACE_bloodIV";};
		for "_i" from 1 to 4 do {player addItemToBackpack "ACE_bloodIV_500";};
				
		player addHeadgear "CUP_H_BAF_Helmet_4_MTP";
		player addGoggles "sam_peltor_bronze";
		
		comment "Add weapons";
		player addWeapon "CUP_arifle_L85A2_G";
		player addPrimaryWeaponItem "CUP_acc_LLM";
		player addPrimaryWeaponItem "CUP_optic_ACOG";
		
		comment "Add items";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
		player linkItem "ItemRadio";
		player linkItem "ItemGPS";
		player linkItem "CUP_NVG_HMNVS";

		comment "Set identity";
		[player,"SAM_SAF"] call bis_fnc_setUnitInsignia;
	};
	
	// GRG M/86 skyttt
	case  "B_soldier_AT_F" : {
		comment "Exported from Arsenal by Kingtiger";

		comment "Remove existing items";
		removeAllWeapons player;
		removeAllItems player;
		removeAllAssignedItems player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeHeadgear player;

		comment "Add containers";
		player forceAddUniform "SAM_Crye_M90_uniform";
		player addItemToUniform "ACE_EarPlugs";
		player addItemToUniform "ACE_Flashlight_MX991";
		player addItemToUniform "ACE_MapTools";
		player addItemToUniform "ACE_EntrenchingTool";
		player addItemToUniform "ACE_IR_Strobe_Item";
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_tourniquet";};
		for "_i" from 1 to 4 do {player addItemToUniform "ACE_elasticBandage";};
		for "_i" from 1 to 6 do {player addItemToUniform "ACE_quikclot";};
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_packingBandage";};
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_morphine";};
		player addItemToUniform "ACE_personalAidKit";
		
		player addVest "SAM_PlateCarrier";
		for "_i" from 1 to 6 do {player addItemToVest "CUP_30Rnd_556x45_Stanag";};
		for "_i" from 1 to 2 do {player addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";};
		for "_i" from 1 to 3 do {player addItemToVest "CUP_HandGrenade_L109A1_HE";};
		for "_i" from 1 to 3 do {player addItemToVest "SmokeShell";};		
		
		player addBackpack "SAM_GRG_Backpack_Heat";
				
		player addHeadgear "SAM_HelmetIA_M90";
		player addGoggles "sam_peltor_bronze";
		
		comment "Add weapons";
		player addWeapon "SAM_AK5C";
		player addPrimaryWeaponItem "CUP_acc_LLM";
		player addPrimaryWeaponItem "CUP_optic_ACOG";
		player addWeapon "sam_grg_m86";
		player addSecondaryWeaponItem "sam_acco_m86";

		comment "Add items";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
		player linkItem "ItemRadio";
		player linkItem "ItemGPS";
		player linkItem "CUP_NVG_HMNVS";

		comment "Set identity";
		[player,"SAM_SAF"] call bis_fnc_setUnitInsignia;
	};
	// GRG M/86 Ladd
	case  "B_soldier_AAT_F" : {
		comment "Exported from Arsenal by Kingtiger";

		comment "Remove existing items";
		removeAllWeapons player;
		removeAllItems player;
		removeAllAssignedItems player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeHeadgear player;

		comment "Add containers";
		player forceAddUniform "SAM_Crye_M90_uniform";
		player addItemToUniform "ACE_EarPlugs";
		player addItemToUniform "ACE_Flashlight_MX991";
		player addItemToUniform "ACE_MapTools";
		player addItemToUniform "ACE_EntrenchingTool";
		player addItemToUniform "ACE_IR_Strobe_Item";
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_tourniquet";};
		for "_i" from 1 to 4 do {player addItemToUniform "ACE_elasticBandage";};
		for "_i" from 1 to 6 do {player addItemToUniform "ACE_quikclot";};
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_packingBandage";};
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_morphine";};
		player addItemToUniform "ACE_personalAidKit";
		
		player addVest "SAM_PlateCarrier";
		for "_i" from 1 to 6 do {player addItemToVest "CUP_30Rnd_556x45_Stanag";};
		for "_i" from 1 to 2 do {player addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";};
		for "_i" from 1 to 3 do {player addItemToVest "CUP_HandGrenade_L109A1_HE";};
		for "_i" from 1 to 3 do {player addItemToVest "SmokeShell";};		
		
		player addBackpack "SAM_GRG_Backpack_Heat";
				
		player addHeadgear "SAM_HelmetIA_M90";
		player addGoggles "sam_peltor_bronze";
		
		comment "Add weapons";
		player addWeapon "SAM_AK5C";
		player addPrimaryWeaponItem "CUP_acc_LLM";
		player addPrimaryWeaponItem "CUP_optic_ACOG";
		
		comment "Add items";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
		player linkItem "ItemRadio";
		player linkItem "ItemGPS";
		player linkItem "CUP_NVG_HMNVS";

		comment "Set identity";
		[player,"SAM_SAF"] call bis_fnc_setUnitInsignia;
	};
	
	// Ingenjör offensiv
	case  "B_soldier_exp_F" : {
		comment "Exported from Arsenal by Kingtiger";

		comment "Remove existing items";
		removeAllWeapons player;
		removeAllItems player;
		removeAllAssignedItems player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeHeadgear player;

		comment "Add containers";
		player forceAddUniform "CUP_U_B_BAF_MTP_S6_UnRolled";
		player addItemToUniform "ACE_EarPlugs";
		player addItemToUniform "ACE_Flashlight_MX991";
		player addItemToUniform "ACE_MapTools";
		player addItemToUniform "ACE_EntrenchingTool";
		player addItemToUniform "ACE_IR_Strobe_Item";
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_tourniquet";};
		for "_i" from 1 to 4 do {player addItemToUniform "ACE_elasticBandage";};
		for "_i" from 1 to 6 do {player addItemToUniform "ACE_quikclot";};
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_packingBandage";};
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_morphine";};
		player addItemToUniform "ACE_personalAidKit";
		
		player addVest "CUP_V_BAF_Osprey_Mk4_MTP_Rifleman";
		for "_i" from 1 to 6 do {player addItemToVest "CUP_30Rnd_556x45_Stanag";};
		for "_i" from 1 to 2 do {player addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";};
		for "_i" from 1 to 3 do {player addItemToVest "CUP_HandGrenade_L109A1_HE";};
		for "_i" from 1 to 3 do {player addItemToVest "SmokeShell";};
		
		player addBackpack "B_Kitbag_mcamo";
		player addItemToBackpack "ACE_SpraypaintGreen";
		player addItemToBackpack "ACE_SpraypaintRed";
		player addItemToBackpack "ACE_DefusalKit";
		player addItemToBackpack "ACE_Clacker";
		for "_i" from 1 to 6 do {player addItemToBackpack "DemoCharge_Remote_Mag";};
		
		
		
		player addHeadgear "CUP_H_BAF_Helmet_4_MTP";
		player addGoggles "sam_peltor_bronze";
		
		comment "Add weapons";
		player addWeapon "CUP_arifle_L85A2_G";
		player addPrimaryWeaponItem "CUP_acc_LLM";
		player addPrimaryWeaponItem "CUP_optic_ACOG";
		player addWeapon "ACE_VMH3";

		comment "Add items";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
		player linkItem "ItemRadio";
		player linkItem "ItemGPS";
		player linkItem "CUP_NVG_HMNVS";

		comment "Set identity";
		[player,"SAM_SAF"] call bis_fnc_setUnitInsignia;
	};
	
	// Helikoperpilot
	case  "B_Helipilot_F" : {
		comment "Exported from Arsenal by Kingtiger";

		comment "Remove existing items";
		removeAllWeapons player;
		removeAllItems player;
		removeAllAssignedItems player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeHeadgear player;

		comment "Add containers";
		player forceAddUniform "CUP_U_B_BAF_MTP_S6_UnRolled";
		player addItemToUniform "ACE_EarPlugs";
		player addItemToUniform "ACE_Flashlight_MX991";
		player addItemToUniform "ACE_MapTools";
		player addItemToUniform "ACE_IR_Strobe_Item";
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_tourniquet";};
		for "_i" from 1 to 4 do {player addItemToUniform "ACE_elasticBandage";};
		for "_i" from 1 to 6 do {player addItemToUniform "ACE_quikclot";};
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_packingBandage";};
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_morphine";};
		player addItemToUniform "ACE_personalAidKit";
		
		player addVest "CUP_V_B_PilotVest";
		for "_i" from 1 to 4 do {player addItemToVest "CUP_30Rnd_556x45_Stanag";};
		for "_i" from 1 to 2 do {player addItemToVest "CUP_17Rnd_9x19_glock17";};
		for "_i" from 1 to 2 do {player addItemToVest "CUP_HandGrenade_L109A1_HE";};
		for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
		
		player addBackpack "tf_rt1523g_big";
		
		player addHeadgear "H_PilotHelmetHeli_B";
				
		comment "Add weapons";
		player addWeapon "CUP_arifle_L85A2_G";
		player addPrimaryWeaponItem "CUP_optic_ACOG";
		player addWeapon "CUP_hgun_Glock17_blk";
		
		comment "Add items";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
		player linkItem "ItemRadio";
		player linkItem "ItemGPS";
		player linkItem "CUP_NVG_HMNVS";

		comment "Set identity";
		[player,"SAM_SAF"] call bis_fnc_setUnitInsignia;
	};
	
	
	// Helikoperspecialist
	case  "B_helicrew_F" : {
		comment "Exported from Arsenal by Kingtiger";

		comment "Remove existing items";
		removeAllWeapons player;
		removeAllItems player;
		removeAllAssignedItems player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeHeadgear player;

		comment "Add containers";
		player forceAddUniform "CUP_U_B_BAF_MTP_S6_UnRolled";
		player addItemToUniform "ACE_EarPlugs";
		player addItemToUniform "ACE_Flashlight_MX991";
		player addItemToUniform "ACE_MapTools";
		player addItemToUniform "ACE_IR_Strobe_Item";
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_tourniquet";};
		for "_i" from 1 to 4 do {player addItemToUniform "ACE_elasticBandage";};
		for "_i" from 1 to 6 do {player addItemToUniform "ACE_quikclot";};
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_packingBandage";};
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_morphine";};
		player addItemToUniform "ACE_personalAidKit";
		
		player addVest "CUP_V_B_PilotVest";
		for "_i" from 1 to 4 do {player addItemToVest "CUP_30Rnd_556x45_Stanag";};
		for "_i" from 1 to 2 do {player addItemToVest "CUP_17Rnd_9x19_glock17";};
		for "_i" from 1 to 2 do {player addItemToVest "CUP_HandGrenade_L109A1_HE";};
		for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
		
		player addHeadgear "H_CrewHelmetHeli_B";
				
		comment "Add weapons";
		player addWeapon "CUP_arifle_L85A2_G";
		player addPrimaryWeaponItem "CUP_optic_ACOG";
		player addWeapon "CUP_hgun_Glock17_blk";
		
		comment "Add items";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
		player linkItem "ItemRadio";
		player linkItem "ItemGPS";
		player linkItem "CUP_NVG_HMNVS";

		comment "Set identity";
		[player,"SAM_SAF"] call bis_fnc_setUnitInsignia;
	};
	
	// Skyttesoldat (med P-skott)
	case  "B_Soldier_F" : {
		comment "Exported from Arsenal by Kingtiger";

		comment "Remove existing items";
		removeAllWeapons player;
		removeAllItems player;
		removeAllAssignedItems player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeHeadgear player;

		comment "Add containers";
		player forceAddUniform "CUP_U_B_BAF_MTP_Tshirt";
		player addItemToUniform "ACE_EarPlugs";
		player addItemToUniform "ACE_Flashlight_MX991";
		player addItemToUniform "ACE_MapTools";
		player addItemToUniform "ACE_EntrenchingTool";
		player addItemToUniform "ACE_IR_Strobe_Item";
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_tourniquet";};
		for "_i" from 1 to 4 do {player addItemToUniform "ACE_elasticBandage";};
		for "_i" from 1 to 6 do {player addItemToUniform "ACE_quikclot";};
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_packingBandage";};
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_morphine";};
		player addItemToUniform "ACE_personalAidKit";
		
		player addVest "CUP_V_BAF_Osprey_Mk4_MTP_Rifleman";
		for "_i" from 1 to 6 do {player addItemToVest "CUP_30Rnd_556x45_Stanag";};
		for "_i" from 1 to 2 do {player addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";};
		for "_i" from 1 to 3 do {player addItemToVest "CUP_HandGrenade_L109A1_HE";};
		for "_i" from 1 to 3 do {player addItemToVest "SmokeShell";};
		
		player addBackpack "B_Kitbag_mcamo";
		for "_i" from 1 to 11 do {player addItemToBackpack "1Rnd_HE_Grenade_shell";};
		for "_i" from 1 to 4 do {player addItemToBackpack "1Rnd_SmokeRed_Grenade_shell";};
		for "_i" from 1 to 4 do {player addItemToBackpack "1Rnd_SmokeBlue_Grenade_shell";};
		player addHeadgear "CUP_H_BAF_Helmet_Net_2_MTP";
		player addGoggles "sam_peltor_bronze";
		
		comment "Add weapons";
		player addWeapon "CUP_arifle_L85A2_GL";
		player addPrimaryWeaponItem "CUP_acc_LLM";
		player addPrimaryWeaponItem "CUP_optic_ACOG";
		player addWeapon "CUP_launch_M72A6";

		comment "Add items";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
		player linkItem "ItemRadio";
		player linkItem "ItemGPS";
		player linkItem "CUP_NVG_HMNVS";

		comment "Set identity";
		[player,"SAM_SAF"] call bis_fnc_setUnitInsignia;
	};
	
	// Ksp 58 ladd
	case  "B_support_AMG_F" : {
		comment "Exported from Arsenal by Kingtiger";

		comment "Remove existing items";
		removeAllWeapons player;
		removeAllItems player;
		removeAllAssignedItems player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeHeadgear player;

		comment "Add containers";
		player forceAddUniform "CUP_U_B_BAF_MTP_Tshirt";
		player addItemToUniform "ACE_EarPlugs";
		player addItemToUniform "ACE_Flashlight_MX991";
		player addItemToUniform "ACE_MapTools";
		player addItemToUniform "ACE_EntrenchingTool";
		player addItemToUniform "ACE_IR_Strobe_Item";
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_tourniquet";};
		for "_i" from 1 to 4 do {player addItemToUniform "ACE_elasticBandage";};
		for "_i" from 1 to 6 do {player addItemToUniform "ACE_quikclot";};
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_packingBandage";};
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_morphine";};
		player addItemToUniform "ACE_personalAidKit";
		
		player addVest "CUP_V_BAF_Osprey_Mk4_MTP_MachineGunner";
		for "_i" from 1 to 6 do {player addItemToVest "CUP_30Rnd_556x45_Stanag";};
		for "_i" from 1 to 2 do {player addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";};
		for "_i" from 1 to 3 do {player addItemToVest "CUP_HandGrenade_L109A1_HE";};
		for "_i" from 1 to 3 do {player addItemToVest "SmokeShell";};
		for "_i" from 1 to 2 do {player addItemToVest "CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M";};
		
		player addBackpack "B_Kitbag_mcamo";
		for "_i" from 1 to 4 do {player addItemToBackpack "CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M";};
		player addHeadgear "CUP_H_BAF_Helmet_1_MTP";
		player addGoggles "sam_peltor_bronze";
		
		comment "Add weapons";
		player addWeapon "CUP_arifle_L85A2_G";
		player addPrimaryWeaponItem "CUP_acc_LLM";
		player addPrimaryWeaponItem "CUP_optic_ACOG";
		player addWeapon "Binocular";

		comment "Add items";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
		player linkItem "ItemRadio";
		player linkItem "ItemGPS";
		player linkItem "CUP_NVG_HMNVS";

		comment "Set identity";
		[player,"SAM_SAF"] call bis_fnc_setUnitInsignia;
	};
	
	// Stridsfordonsbesättning
	case  "B_crew_F" : {
		comment "Exported from Arsenal by Kingtiger";

		comment "Remove existing items";
		removeAllWeapons player;
		removeAllItems player;
		removeAllAssignedItems player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeHeadgear player;

		comment "Add containers";
		player forceAddUniform "CUP_U_B_BAF_MTP_Tshirt";
		player addItemToUniform "ACE_EarPlugs";
		player addItemToUniform "ACE_Flashlight_MX991";
		player addItemToUniform "ACE_MapTools";
		player addItemToUniform "ACE_IR_Strobe_Item";
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_tourniquet";};
		for "_i" from 1 to 4 do {player addItemToUniform "ACE_elasticBandage";};
		for "_i" from 1 to 6 do {player addItemToUniform "ACE_quikclot";};
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_packingBandage";};
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_morphine";};
		player addItemToUniform "ACE_personalAidKit";
		
		player addVest "CUP_V_BAF_Osprey_Mk4_MTP_SquadLeader";
		for "_i" from 1 to 4 do {player addItemToVest "CUP_30Rnd_556x45_Stanag";};
		for "_i" from 1 to 2 do {player addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";};
		for "_i" from 1 to 2 do {player addItemToVest "CUP_HandGrenade_L109A1_HE";};
		for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
		
		player addHeadgear "CUP_H_BAF_Crew_Helmet_MTP";
		player addGoggles "sam_peltor_bronze";
		
		comment "Add weapons";
		player addWeapon "CUP_arifle_L85A2_G";
		player addPrimaryWeaponItem "CUP_optic_ACOG";

		comment "Add items";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
		player linkItem "ItemRadio";
		player linkItem "ItemGPS";
		player linkItem "CUP_NVG_HMNVS";

		comment "Set identity";
		[player,"SAM_SAF"] call bis_fnc_setUnitInsignia;
	};
	
};