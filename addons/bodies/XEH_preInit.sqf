#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(simpleBodies) = [];
GVAR(simpleBodiesLimit) = 100;

GVAR(bodyAnims) = [
  // Back
  [
    ["R_death_008", {_this + 180}, {_this # 0}],
    ["R_death_010", {_this + 180}, {_this # 0}],
    ["R_death_016", {_this + 180}, {_this # 0}],
    ["R_death_026", {_this + 180}, {_this # 0}],
    ["R_death_032", {_this + 130}, {_this # 0}],
    ["R_death_036", {_this + 175}, {_this # 0}],
    ["ZSL_Dead009", {_this + 180}, {(_this # 0) getPos [0.5, (_this # 1) + 180]}],
    ["ZSL_Dead010", {_this + 180}, {(_this # 0) getPos [0.5, (_this # 1) + 180]}],
    ["ZSL_Dead012", {_this + 180}, {(_this # 0) getPos [1.3, (_this # 1) + 160]}],
    ["ZSL_Dead013", {_this + 180}, {(_this # 0)}]
  ],
  // Chest
  [
    ["R_death_001", {_this}, {_this # 0}],
    ["R_death_003", {_this + 5}, {_this # 0}],
    ["R_death_017", {_this}, {_this # 0}],
    ["R_death_018", {_this}, {_this # 0}],
    ["R_death_020", {_this}, {_this # 0}],
    ["ZSL_Dead006", {_this}, {(_this # 0) getPos [0.85, (_this # 1) + 180]}],
    ["ZSL_Dead007", {_this}, {(_this # 0) getPos [0.3, (_this # 1) + 180]}],
    ["ZSL_Dead011", {_this}, {(_this # 0) getPos [0.3, (_this # 1)]}]
  ],
  // Right arm
  [
    ["R_death_007", {_this + 85}, {_this # 0}],
    ["R_death_022", {_this + 5}, {_this # 0}],
    ["R_death_037", {_this - 5}, {_this # 0}]
  ],
  // Left arm
  [
    ["R_death_002", {_this + 180}, {_this # 0}],
    ["R_death_009", {_this + 15}, {_this # 0}],
    ["R_death_035", {_this + 10}, {_this # 0}]
  ]
];

ADDON = true;
