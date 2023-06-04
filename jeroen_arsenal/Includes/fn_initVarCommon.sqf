/*
 * This is the first initVar that gets called, and it gets called on both the client and the server.
 * Generally, this should only be constants.
 */

scriptName "initVarCommon.sqf";
#include "..\script_component.hpp"
FIX_LINE_NUMBERS()
Info("initVarCommon started");

////////////////////////////////////
// INITIAL SETTING AND VARIABLES ///
////////////////////////////////////
Info("Setting initial variables");
debug = false;
//A3A_customHintEnable = false; // Disables custom hints for boot duration. Is set to true in initClient.

////////////////////////////////////
//     BEGIN SIDES AND COLORS    ///
////////////////////////////////////

Occupants = west;
Invaders = east;
teamPlayer = independent;		// uh, probably don't need this yet unless something is busted?
colorOccupants = "colorBLUFOR";
colorInvaders = "colorOPFOR";
colorTeamPlayer = "colorGUER";
respawnTeamPlayer = "respawn_guerrila";			// not really sure why we have two markers here (also "Synd_HQ")
posHQ = getMarkerPos respawnTeamPlayer;

////////////////////////////////////////
//     DECLARING PATCOM VARIABLES    ///
////////////////////////////////////////
Info("Initialising PATCOM Variables");

PATCOM_DEBUG = false; // Enable PATCOM specific debug.
PATCOM_VISUAL_RANGE = 400; // How far before PATCOM can start to detect enemies.
PATCOM_TARGET_TIME = 120; // How long before PATCOM unit forgets about an enemy.
PATCOM_ARTILLERY_MANAGER = true; // Allow Patcome to control AI Artillery. False is default A3 Artillery AI.
PATCOM_ARTILLERY_DELAY = 30; // How quickly artillery becomes available again after firing in seconds.
PATCOM_AI_STATICS = true; // Allow AI to find and arm statics near their group.
PATCOM_AI_STATIC_ARM = 120; // How long AI stay on static weapons after they arm them.

////////////////////////////////////////
//     DECLARING ITEM CATEGORIES     ///
////////////////////////////////////////
Info("Declaring item categories");

weaponCategories = ["Rifles", "Handguns", "MachineGuns", "MissileLaunchers", "Mortars", "RocketLaunchers", "Shotguns", "SMGs", "SniperRifles", "UsedLaunchers"];
itemCategories = ["Gadgets", "Bipods", "MuzzleAttachments", "PointerAttachments", "Optics", "Binoculars", "Compasses", "FirstAidKits", "GPS", "LaserDesignators",
	"Maps", "Medikits", "MineDetectors", "NVGs", "Radios", "Toolkits", "UAVTerminals", "Watches", "Glasses", "Headgear", "Vests", "Uniforms", "Backpacks"];

magazineCategories = ["MagArtillery", "MagBullet", "MagFlare", "Grenades", "MagLaser", "MagMissile", "MagRocket", "MagShell", "MagShotgun", "MagSmokeShell"];
explosiveCategories = ["Mine", "MineBounding", "MineDirectional"];
otherCategories = ["Unknown"];

//************************************************************************************************************
//ALL ITEMS THAT ARE MEMBERS OF CATEGORIES BELOW THIS LINE **MUST** BE A MEMBER OF ONE OF THE ABOVE CATEGORIES.
//************************************************************************************************************

//Categories that consist only of members of other categories, e.g, 'Weapons' contains items of every category from in weaponCategories;
aggregateCategories = ["Weapons", "Items", "Magazines", "Explosives"];

//All items in here *must* also be a member of one of the above categories.
//These are here because it's non-trivial to identify items in them. They might be a very specific subset of items, or the logic that identifies them might not be perfect.
//It's recommended that these categories be used with caution.
specialCategories = ["AA", "AT", "GrenadeLaunchers", "LightAttachments", "LaserAttachments", "Chemlights", "SmokeGrenades", "LaunchedSmokeGrenades", "LaunchedFlares", "HandFlares", "IRGrenades","LaserBatteries",
	"RebelUniforms", "CivilianUniforms", "BackpacksEmpty", "BackpacksTool", "BackpacksStatic", "BackpacksDevice", "BackpacksRadio", "CivilianVests", "ArmoredVests", "ArmoredHeadgear", "CosmeticHeadgear",
	"CosmeticGlasses", "ThermalNVGs", "OpticsClose", "OpticsMid", "OpticsLong", "ExplosiveCharges", "Disposable"];


allCategoriesExceptSpecial = weaponCategories + itemCategories + magazineCategories + explosiveCategories + otherCategories + aggregateCategories;
allCategories = allCategoriesExceptSpecial + specialCategories;

// Initialize categoryOverrides. Clients need this for equipmentClassToCategories to work.
//[] call A3A_fnc_categoryOverrides;

////////////////////////////////////
//     BEGIN MOD DETECTION       ///
////////////////////////////////////
Info("Starting mod detection");

// Load the climate here for the moment, because we need it early and globally
private _worldName = toLower worldName;
A3A_climate = toLower (if (isText (missionConfigFile/"A3A"/"mapInfo"/_worldName/"climate")) then {
    getText (missionConfigFile/"A3A"/"mapInfo"/_worldName/"climate")
} else {
    getText (configFile/"A3A"/"mapInfo"/_worldName/"climate")
});

// Short Info of loaded mods needs to be added to this array. eg: `A3A_loadedTemplateInfoXML pushBack ["RHS","All factions will be replaced by RHS (AFRF &amp; USAF &amp; GREF)."];`
A3A_loadedTemplateInfoXML = [];

//Mod detection is done locally to each client, in case some clients have different modsets for some reason.
//Radio Detection
A3A_hasTFAR = isClass (configFile >> "CfgPatches" >> "task_force_radio");
A3A_hasACRE = isClass (configFile >> "cfgPatches" >> "acre_main");
A3A_hasTFARBeta = isClass (configFile >> "CfgPatches" >> "tfar_static_radios");
if (A3A_hasTFARBeta) then {A3A_hasTFAR = false};
//ACE Detection
A3A_hasACE = (!isNil "ace_common_fnc_isModLoaded");
A3A_hasACEHearing = isClass (configFile >> "CfgSounds" >> "ACE_EarRinging_Weak");
A3A_hasACEMedical = isClass (configFile >> "CfgSounds" >> "ACE_heartbeat_fast_3");

//ADV-CPR Pike Edition detection
A3A_hasADV = false;
if (A3A_hasACEMedical && isClass (configFile >> "CfgPatches" >> "adv_aceCPR")) then {A3A_hasADV = true; Info("ADV Detected.") };

//KAT medical detection
A3A_hasKAT = false;
if(A3A_hasACEMedical && isClass (configFile >> "CfgWeapons" >> "kat_scalpel")) then {A3A_hasKAT = true; Info("KAT MED Detected.") };

A3A_hasIFA = false;			// this one is everywhere, just mark it false and remove later

//Content Mods (Units, Vehicles, Weapons, Clothes etc.)
//These are handled by a script in the Templates folder to keep integrators away from critical code.
//call A3A_fnc_detector;

Info("initVarCommon completed");
