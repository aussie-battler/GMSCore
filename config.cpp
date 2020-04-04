/*
	Copyright 2020 by Ghostrider-GRG-
*/

#include "\GMSCore\Init\GMS_defines.hpp"

class GMSCoreBuild {
	version = 1;
	build = 1;
	buildDate = "4-3-20";
};
class CfgPatches {
	class GMSCore {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {};
	};
};
class CfgFunctions {
	class GMS {
		class GMS_Airdrops {
			file = "GMSCore\Compiles\Airdrops";
			class arrivedOnStation {};
			class cleanUp {};
			class dropParatroops {};
			class dropPayload {};
			class flyInCargoToLocation {};			
			class hoverAndDropOff {};
			class selectDropWaypoint {};			
		};		
		class GMS_CoreFunctions {
			file = "GMSCore\Compiles\Functions";
			class addObjectToDeletionCue {};
			//class configureMapParameters {};
			//class addObjectsToDeletionCue {};
			class getNumberFromRange {};
			class getIntegerFromRange {};
			class dynamicConfigs {};
 			class findRandomPosWithinArea {};
			class getCfgType {};
			class isClass {};
			class checkClassnamesArray {};
			class checkClassnamesWeightedArray {};
			class removeBlacklistedItems {};
			class substringsPresentInString {};
			//class removeEventHandlers {};
			//class removeMPEventHandlers {};
			class getDimensions {};
			class mainThread {};
			class monitorMarkers {};
			//class monitorGroups {};
			// class monitorVehicles {};
			class monitorObjectDeletionCue {};
			//class removeAllEventHandlers {};
			//class removeAllMPEventHandlers {};
			//class monitorCorpses {};
		};
		class GMS_Client {
			file = "GMSCore\Compiles\Client";
			class messagePlayers {};
		};
		class GMS_Crates {
			file = "GMSCore\Compiles\Crates";
			class spawnCrate {}; // which can be any object, but is a crate by default.
			class addItem {};
			class addItemsFromArray {};  // weighted array either a single array, or array of arrays.
			class spawnPayload {};
			class visibleMarker {};
		};

		class GMS_Groups {
			file = "GMSCore\Compiles\Groups";
			class addUnitEventHandlers {};
			class alertGroup {};
			class allertNearestGroup {};
			class boostGroupAttributes {};
			class createGroup {};	
			class createUnmanedVehicleCrew {};
			class despawnInfantryGroup {};
			class groupCanSee {};					
			class getGroupIntelligence {};
			class groupRemoveAllGear {};
			class setGroupBehaviors {};
			class setupGroupMoney {};			
			class setMaxRelaodsGroup {};
			class setupGroupSkills {};
			class setupGroupGear {};
			class setupGroupBehavior {};
			//class setGroupBodyDespawnTime {};	
			class spawnInfantryGroup {};					
		};		
		class GMS_Initialization {
			file = "GMSCore\init";
			class Initialize {postInit = 1;};
		};
		class GMS_Objects {
			file = "GMSCore\Compiles\Objects";
			class addObjectToDeletionCue {};
			class removeAllEventHandlers {};
			class removeAllMPEventHandlers {};
			class emptyObjectInventory {};	
			class spawnObject {};		
		};				
		class GMS_Players {
			file = "GMSCore\Compiles\Players";
			class giveTakeCrypto {};  // Please see credits in the sqf.
			class giveTakeRespect {};
			class giveTakeTabs {};
			class updatePlayerKills {};
		};
		class GMS_Utilities {
			file = "GMSCore\Compiles\Utilities";
			class log {};
		};
		class GMS_Units {
			file = "GMSCore\Compiles\Units";
			class unitRemoveAllGear {};
			class removeNVG {};
			class removeLauncher {};			
			//class throwSmoke {};
			class healSelf {};
			class unitCanSee {};
			class unitHit {};
			class unitKilled {};
			class unitReloaded {};
		};
		class GMS_Vehicles {
			file = "GMSCore\Compiles\Vehicles";
			class allowPlayerVehicleAccess {};
			class createVehicle {};
			class getOutVehicle {};
			class vehicleHandleDamage {};
			class initializePatrolVehicle {};
			class loadVehicleCrew {};
			class restrictPlayerVehicleAcess {};
		};		
		class GMS_Waypoints {
			// general functions for handling waypoints within a patrol area
			file = "GMSCore\Compiles\Waypoints";
			class addMonitoredAreaPatrol {};
			class assignTargetAreaPatrol {};			
			class isStuck {};
			class getWaypointLastCheckedTime {};
			class getWaypointPatrolAreaMarker {};
			class initializeWaypointsAreaPatrol {};
			class monitorAreaPatrols {};			
			class nextWaypointAreaPatrol {};
			class setWaypointStuckValue {};
			class setWaypointLastCheckedTime {};
			class setWaypointPatrolAreaMarker {};
		};
	};
};
