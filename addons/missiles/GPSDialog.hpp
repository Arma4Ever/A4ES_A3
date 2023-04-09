#include "\a3\ui_f\hpp\defineCommonGrids.inc"
#include "\a3\ui_f\hpp\defineCommonColors.inc"

class RscText;
class RscEdit;
class RscPicture;
class RscButton;
class ctrlXSliderH;

class ace_missileguidance_gpsAttackOptionsUI {
	class controlsBackground {
		class Header: RscText {
			x = QUOTE(13.5 * GUI_GRID_W + GUI_GRID_CENTER_X);
			y = QUOTE(5 * GUI_GRID_H + GUI_GRID_CENTER_Y);
			w = QUOTE(18 * GUI_GRID_W);
			h = QUOTE(GUI_GRID_H);
		};
		class Background: RscText {
			x = QUOTE(13.5 * GUI_GRID_W + GUI_GRID_CENTER_X);
			y = QUOTE(6.1 * GUI_GRID_H + GUI_GRID_CENTER_Y);
			w = QUOTE(18 * GUI_GRID_W);
			h = QUOTE(8.0 * GUI_GRID_H);
		};
	};
	class controls {
		class TOOButton: RscButton {
			x = QUOTE(14 * GUI_GRID_W + GUI_GRID_CENTER_X);
			y = QUOTE(6.3 * GUI_GRID_H + GUI_GRID_CENTER_Y);
			w = QUOTE(10 * GUI_GRID_W);
			h = QUOTE(GUI_GRID_H);
		};
		class PPButton: RscButton {
			x = QUOTE(26 * GUI_GRID_W + GUI_GRID_CENTER_X);
			y = QUOTE(6.3 * GUI_GRID_H + GUI_GRID_CENTER_Y);
			w = QUOTE(5 * GUI_GRID_W);
			h = QUOTE(GUI_GRID_H);
		};
		class PPMission: RscText {
			x = QUOTE(27.5 * GUI_GRID_W + GUI_GRID_CENTER_X);
			y = QUOTE(7.5 * GUI_GRID_H + GUI_GRID_CENTER_Y);
			w = QUOTE(2 * GUI_GRID_W);
			h = QUOTE(GUI_GRID_H);
		};
		class PPMissionBackward: RscButton {
			x = QUOTE(26 * GUI_GRID_W + GUI_GRID_CENTER_X);
			y = QUOTE(7.5 * GUI_GRID_H + GUI_GRID_CENTER_Y);
			w = QUOTE(1 * GUI_GRID_W);
			h = QUOTE(GUI_GRID_H);
		};
		class PPMissionForward: RscButton {
			x = QUOTE(30 * GUI_GRID_W + GUI_GRID_CENTER_X);
			y = QUOTE(7.5 * GUI_GRID_H + GUI_GRID_CENTER_Y);
			w = QUOTE(1 * GUI_GRID_W);
			h = QUOTE(GUI_GRID_H);
		};
		class TargetPosXText: RscText {
			x = QUOTE(14 * GUI_GRID_W + GUI_GRID_CENTER_X);
			y = QUOTE(8.5 * GUI_GRID_H + GUI_GRID_CENTER_Y);
			w = QUOTE(3 * GUI_GRID_W);
			h = QUOTE(GUI_GRID_H);
		};
		class TargetPosX: RscEdit {
			x = QUOTE(17.3 * GUI_GRID_W + GUI_GRID_CENTER_X);
			y = QUOTE(8.5 * GUI_GRID_H + GUI_GRID_CENTER_Y);
			w = QUOTE(2.5 * GUI_GRID_W);
			h = QUOTE(GUI_GRID_H);
		};
		class TargetPosYText: RscText {
			x = QUOTE(14 * GUI_GRID_W + GUI_GRID_CENTER_X);
			y = QUOTE(9.7 * GUI_GRID_H + GUI_GRID_CENTER_Y);
			w = QUOTE(3 * GUI_GRID_W);
			h = QUOTE(GUI_GRID_H);
		};
		class TargetPosY: TargetPosX {
			x = QUOTE(17.3 * GUI_GRID_W + GUI_GRID_CENTER_X);
			y = QUOTE(9.7 * GUI_GRID_H + GUI_GRID_CENTER_Y);
		};
		class TargetPosHeightText: RscText {
			x = QUOTE(14 * GUI_GRID_W + GUI_GRID_CENTER_X);
			y = QUOTE(11.7 * GUI_GRID_H + GUI_GRID_CENTER_Y);
			w = QUOTE(3 * GUI_GRID_W);
			h = QUOTE(GUI_GRID_H);
		};
		class TargetPosHeight: TargetPosX {
			x = QUOTE(17.3 * GUI_GRID_W + GUI_GRID_CENTER_X);
			y = QUOTE(11.7 * GUI_GRID_H + GUI_GRID_CENTER_Y);
		};
		class TargetPosHeightUnits: RscText {
			x = QUOTE(19.6 * GUI_GRID_W + GUI_GRID_CENTER_X);
			y = QUOTE(11.7 * GUI_GRID_H + GUI_GRID_CENTER_Y);
			w = QUOTE(1 * GUI_GRID_W);
			h = QUOTE(GUI_GRID_H);
		};
		class ImpactAngleText: RscText {
			x = QUOTE(21 * GUI_GRID_W + GUI_GRID_CENTER_X);
			y = QUOTE(9.7 * GUI_GRID_H + GUI_GRID_CENTER_Y);
			w = QUOTE(4 * GUI_GRID_W);
			h = QUOTE(GUI_GRID_H);
		};
		class ImpactAngle: RscEdit {
			x = QUOTE(26.3 * GUI_GRID_W + GUI_GRID_CENTER_X);
			y = QUOTE(9.7 * GUI_GRID_H + GUI_GRID_CENTER_Y);
			w = QUOTE(2 * GUI_GRID_W);
			h = QUOTE(GUI_GRID_H);
		};
		class AttackHeadingText: RscText {
			x = QUOTE(21 * GUI_GRID_W + GUI_GRID_CENTER_X);
			y = QUOTE(11 * GUI_GRID_H + GUI_GRID_CENTER_Y);
			w = QUOTE(5 * GUI_GRID_W);
			h = QUOTE(GUI_GRID_H);
		};
		class AttackHeading: RscEdit {
			x = QUOTE(26.3 * GUI_GRID_W + GUI_GRID_CENTER_X);
			y = QUOTE(11 * GUI_GRID_H + GUI_GRID_CENTER_Y);
			w = QUOTE(2 * GUI_GRID_W);
			h = QUOTE(GUI_GRID_H);
		};
		class CancelButton: RscButton {
			x = QUOTE(13.5 * GUI_GRID_W + GUI_GRID_CENTER_X);
			y = QUOTE(14.2 * GUI_GRID_H + GUI_GRID_CENTER_Y);
			w = QUOTE(5 * GUI_GRID_W);
			h = QUOTE(GUI_GRID_H);
		};
		class ConfirmButton: CancelButton {
			x = QUOTE(27.5 * GUI_GRID_W + GUI_GRID_CENTER_X);
		};
	};
};