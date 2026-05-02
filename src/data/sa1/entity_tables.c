#include "global.h"
#include "constants/sa1/zones.h"

extern const u8 zone_1_act_1_rings[];
extern const u8 zone_1_act_2_rings[];
extern const u8 zone_2_act_1_rings[];
extern const u8 zone_2_act_2_rings[];
extern const u8 zone_3_act_1_rings[];
extern const u8 zone_3_act_2_rings[];
extern const u8 zone_4_act_1_rings[];
extern const u8 zone_4_act_2_rings[];
extern const u8 zone_5_act_1_rings[];
extern const u8 zone_5_act_2_rings[];
extern const u8 zone_6_act_1_rings[];
extern const u8 zone_6_act_2_rings[];
extern const u8 zone_7_act_1_rings[];
extern const u8 zone_7_act_2_rings[];
extern const u8 chao_hunt_vs_zone_a_rings[];
extern const u8 chao_hunt_vs_zone_b_rings[];
extern const u8 chao_hunt_vs_zone_c_rings[];
extern const u8 chao_hunt_vs_zone_d_rings[];

extern u8 zone_1_act_1_interactables[];
extern u8 zone_1_act_2_interactables[];
extern u8 zone_2_act_1_interactables[];
extern u8 zone_2_act_2_interactables[];
extern u8 zone_3_act_1_interactables[];
extern u8 zone_3_act_2_interactables[];
extern u8 zone_4_act_1_interactables[];
extern u8 zone_4_act_2_interactables[];
extern u8 zone_5_act_1_interactables[];
extern u8 zone_5_act_2_interactables[];
extern u8 zone_6_act_1_interactables[];
extern u8 zone_6_act_2_interactables[];
extern u8 zone_7_act_1_interactables[];
extern u8 zone_7_act_2_interactables[];
extern u8 chao_hunt_vs_zone_a_interactables[];
extern u8 chao_hunt_vs_zone_b_interactables[];
extern u8 chao_hunt_vs_zone_c_interactables[];
extern u8 chao_hunt_vs_zone_d_interactables[];

extern u8 zone_1_act_1_itemboxes[];
extern u8 zone_1_act_2_itemboxes[];
extern u8 zone_2_act_1_itemboxes[];
extern u8 zone_2_act_2_itemboxes[];
extern u8 zone_3_act_1_itemboxes[];
extern u8 zone_3_act_2_itemboxes[];
extern u8 zone_4_act_1_itemboxes[];
extern u8 zone_4_act_2_itemboxes[];
extern u8 zone_5_act_1_itemboxes[];
extern u8 zone_5_act_2_itemboxes[];
extern u8 zone_6_act_1_itemboxes[];
extern u8 zone_6_act_2_itemboxes[];
extern u8 zone_7_act_1_itemboxes[];
extern u8 zone_7_act_2_itemboxes[];
extern u8 chao_hunt_vs_zone_a_itemboxes[];
extern u8 chao_hunt_vs_zone_b_itemboxes[];
extern u8 chao_hunt_vs_zone_c_itemboxes[];
extern u8 chao_hunt_vs_zone_d_itemboxes[];

extern u8 zone_1_act_1_enemies[];
extern u8 zone_1_act_2_enemies[];
extern u8 zone_2_act_1_enemies[];
extern u8 zone_2_act_2_enemies[];
extern u8 zone_3_act_1_enemies[];
extern u8 zone_3_act_2_enemies[];
extern u8 zone_4_act_1_enemies[];
extern u8 zone_4_act_2_enemies[];
extern u8 zone_5_act_1_enemies[];
extern u8 zone_5_act_2_enemies[];
extern u8 zone_6_act_1_enemies[];
extern u8 zone_6_act_2_enemies[];
extern u8 zone_7_act_1_enemies[];
extern u8 zone_7_act_2_enemies[];
extern u8 chao_hunt_vs_zone_a_enemies[];
extern u8 chao_hunt_vs_zone_b_enemies[];
extern u8 chao_hunt_vs_zone_c_enemies[];
extern u8 chao_hunt_vs_zone_d_enemies[];

const RLCompressed *const gSpritePosData_rings[NUM_LEVEL_IDS] = {
    (void *)&zone_1_act_1_rings,        (void *)&zone_1_act_2_rings,        (void *)&zone_2_act_1_rings,
    (void *)&zone_2_act_2_rings,        (void *)&zone_3_act_1_rings,        (void *)&zone_3_act_2_rings,
    (void *)&zone_4_act_1_rings,        (void *)&zone_4_act_2_rings,        (void *)&zone_5_act_1_rings,
    (void *)&zone_5_act_2_rings,        (void *)&zone_6_act_1_rings,        (void *)&zone_6_act_2_rings,
    (void *)&zone_7_act_1_rings,        (void *)&zone_7_act_2_rings,        (void *)&chao_hunt_vs_zone_a_rings,
    (void *)&chao_hunt_vs_zone_b_rings, (void *)&chao_hunt_vs_zone_c_rings, (void *)&chao_hunt_vs_zone_d_rings,
};

const RLCompressed *const gSpritePosData_interactables[NUM_LEVEL_IDS] = {
    (void *)&zone_1_act_1_interactables,        (void *)&zone_1_act_2_interactables,        (void *)&zone_2_act_1_interactables,
    (void *)&zone_2_act_2_interactables,        (void *)&zone_3_act_1_interactables,        (void *)&zone_3_act_2_interactables,
    (void *)&zone_4_act_1_interactables,        (void *)&zone_4_act_2_interactables,        (void *)&zone_5_act_1_interactables,
    (void *)&zone_5_act_2_interactables,        (void *)&zone_6_act_1_interactables,        (void *)&zone_6_act_2_interactables,
    (void *)&zone_7_act_1_interactables,        (void *)&zone_7_act_2_interactables,        (void *)&chao_hunt_vs_zone_a_interactables,
    (void *)&chao_hunt_vs_zone_b_interactables, (void *)&chao_hunt_vs_zone_c_interactables, (void *)&chao_hunt_vs_zone_d_interactables,
};

const RLCompressed *const gSpritePosData_itemboxes[NUM_LEVEL_IDS] = {
    (void *)&zone_1_act_1_itemboxes,        (void *)&zone_1_act_2_itemboxes,        (void *)&zone_2_act_1_itemboxes,
    (void *)&zone_2_act_2_itemboxes,        (void *)&zone_3_act_1_itemboxes,        (void *)&zone_3_act_2_itemboxes,
    (void *)&zone_4_act_1_itemboxes,        (void *)&zone_4_act_2_itemboxes,        (void *)&zone_5_act_1_itemboxes,
    (void *)&zone_5_act_2_itemboxes,        (void *)&zone_6_act_1_itemboxes,        (void *)&zone_6_act_2_itemboxes,
    (void *)&zone_7_act_1_itemboxes,        (void *)&zone_7_act_2_itemboxes,        (void *)&chao_hunt_vs_zone_a_itemboxes,
    (void *)&chao_hunt_vs_zone_b_itemboxes, (void *)&chao_hunt_vs_zone_c_itemboxes, (void *)&chao_hunt_vs_zone_d_itemboxes,
};

const RLCompressed *const gSpritePosData_enemies[NUM_LEVEL_IDS] = {
    (void *)&zone_1_act_1_enemies,        (void *)&zone_1_act_2_enemies,        (void *)&zone_2_act_1_enemies,
    (void *)&zone_2_act_2_enemies,        (void *)&zone_3_act_1_enemies,        (void *)&zone_3_act_2_enemies,
    (void *)&zone_4_act_1_enemies,        (void *)&zone_4_act_2_enemies,        (void *)&zone_5_act_1_enemies,
    (void *)&zone_5_act_2_enemies,        (void *)&zone_6_act_1_enemies,        (void *)&zone_6_act_2_enemies,
    (void *)&zone_7_act_1_enemies,        (void *)&zone_7_act_2_enemies,        (void *)&chao_hunt_vs_zone_a_enemies,
    (void *)&chao_hunt_vs_zone_b_enemies, (void *)&chao_hunt_vs_zone_c_enemies, (void *)&chao_hunt_vs_zone_d_enemies,
};
