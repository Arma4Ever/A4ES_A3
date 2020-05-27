class CfgFunctions {
	class 3denEnhanced {
		tag = "ENH";
		class Garrison {
            file = PATHTOF(ENH\functions\GUI\garrison);
			class garrison_onLoad;
			class garrison_garrison;
		};
		class TextureFinder {
            file = PATHTOF(ENH\functions\GUI\TextureFinder);
			class textureFinder_updateProgressbar;
			class textureFinder_findTextures;
			class textureFinder_exportTexturePath;
			class textureFinder_fillTextureLB;
			class textureFinder_search;
			class textureFinder_showTexture;
		};
		class BatchReplace {
            file = PATHTOF(ENH\functions\GUI\batchReplace);
			class batchReplace_createDisplay;
			class batchReplace;
		};
		class FunctionsViewer {
            file = PATHTOF(ENH\functions\GUI\functionsViewer);
			class functionsViewer_onLoad;
			class functionsViewer_onTreeSelChanged;
			class functionsViewer_recompileSelected;
			class functionsViewer_copy;
			class functionsViewer_getFunctionsData;
			class functionsViewer_fillCtrlTV;
		};
		class PlacementTools {
            file = PATHTOF(ENH\functions\GUI\placementTools);
			class placementTools_onLoad;
			class placementTools_onUnload;
			class placementTools_createDisplay;
			class placementTools_centralAngle;
			class placementTools_fillArea;
			class placementTools_grid;
			class placementTools_radius;
			class placementTools_initialAngle;
			class placementTools_spacing;
			class placementTools_onToolBoxSelChanged;
		};
		class NameObjects {
            file = PATHTOF(ENH\functions\GUI\nameObjects);
			class nameObjects_onLoad;
			class nameObjects_name;
		};
		class Misc {
            file = PATHTOF(ENH\functions\Misc);
			class measureDistance;
			class deleteCrew;
			class deleteEmptyLayers;
			class setOrientation;
			class all3DENSelected;
			class statusbar_entityCounter;
			class exportWithLB;
			class 3denNotificationNoSound;
			class locationList;
			class toggleDrawBuildingPositions;
			class toggleDrawDLCIcons;
			class toggleAttribute;
			class floatToTime;
			class firstPerson;
			class 3DENCollapseAssetBrowser;
		};
		class Log {
            file = PATHTOF(ENH\functions\log);
			class logPositions3D;
			class logPositions2D;
			class logGridPosition;
			class logClassesString;
		};
		class Debug {
            file = PATHTOF(ENH\functions\debug);
			class sessionTimer;
			class checkShortCutsDuplicates;
		};
		class EventHandlers {
            file = PATHTOF(ENH\functions\eventHandlers);
			class EH_onMissionLoad;
			class EH_onMissionNew;
			class EH_onMissionPreviewEnd;
			class EH_onSelectionChange;
			class EH_onTerrainNew;
		};
		class AttributeControls {
            file = PATHTOF(ENH\functions\attributeControls);
			class timeMultiplier_onAttributeLoad;
			class timeMultiplier_onAttributeSave;
		};
	};
};
