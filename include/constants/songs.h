#ifndef GUARD_CONSTANTS_SONGS_H
#define GUARD_CONSTANTS_SONGS_H

#define MUS_DUMMY               0
#define MUS_INTRO               1
#define MUS_TITLE_FANFARE       2
#define MUS_CHARACTER_SELECTION 3
#define MUS_TA_COURSE_SELECTION 4 // plays both in Time Attack and (initially) the zone map
#define MUS_COURSE_SELECTION_2  5
#define MUS_COURSE_SELECTION_3  6
#define MUS_TIME_ATTACK_MENU    7
// 8
#define MUS_OPTIONS 9
// 10
// 11
// 12
#define MUS_LEAF_FOREST__ACT_1  13
#define MUS_LEAF_FOREST__ACT_2  14
#define MUS_HOT_CRATER__ACT_1   15
#define MUS_HOT_CRATER__ACT_2   16
#define MUS_MUSIC_PLANT__ACT_1  17
#define MUS_MUSIC_PLANT__ACT_2  18
#define MUS_ICE_PARADISE__ACT_1 19
#define MUS_ICE_PARADISE__ACT_2 20
#define MUS_SKY_CANYON__ACT_1   21
#define MUS_SKY_CANYON__ACT_2   22
#define MUS_TECHNO_BASE__ACT_1  23
#define MUS_TECHNO_BASE__ACT_2  24
#define MUS_EGG_UTOPIA__ACT_1   25
#define MUS_EGG_UTOPIA__ACT_2   26
#define MUS_XX__FINAL_ZONE      27
#define MUS_TRUE_AREA_53        28
#define MUS_INVINCIBILITY       29
// 30
#define MUS_DROWNING         31
#define MUS_BOSS             32
#define MUS_BOSS_PINCH       33
#define MUS_BOSS_KNUCKLES    34
#define MUS_7_BOSS           35
#define MUS_7_BOSS_PINCH     36
#define MUS_FINAL_BOSS       37
#define MUS_FINAL_BOSS_PINCH 38
// 39
// 40
#define MUS_GAME_OVER     41
#define MUS_FINAL_ENDING  42
#define MUS_EXTRA_ENDING  43
#define MUS_STAFF_CREDITS 44
#define MUS_DEMO_1        45
#define MUS_DEMO_2        46
// 47
#define MUS_EXTRA_DEMO_1              48
#define MUS_EXTRA_DEMO_2              49
#define MUS_SPECIAL_STAGE_INTRO       50
#define MUS_SPECIAL_STAGE             51
#define MUS_SPECIAL_STAGE_PINCH       52
#define MUS_ACHIEVEMENT               53
#define MUS_SPECIAL_STAGE_CLEAR       54
#define MUS_SPECIAL_STAGE_RESULT      55
#define MUS_CHAOS_EMERALD             56
#define MUS_SPECIAL_STAGE_RESULT_LOSE 57
#define MUS_VS_2                      58
#define MUS_VS_3                      59
// 60
#define MUS_CONNECTION_PENDING 61
// 62
// 63
#ifndef COLLECT_RINGS_ROM
#define MUS_VS_LOBBY 64
#else
#define MUS_VS_LOBBY 3
#endif
// 65
#ifndef COLLECT_RINGS_ROM
#define MUS_VS_SELECT_PAK_MODE 66
#else
#define MUS_VS_SELECT_PAK_MODE 1
#endif

/* 67 - 101: Dummies */

// TODO: Many soundeffect IDs are shared between SA! and SA2!
#define SE_RING             102
#define SE_SHIFT            103
#define SE_SUCCESS          104
#define SE_ABORT            105
#define SE_SELECT           106
#define SE_RETURN           107
#define SE_MENU_CURSOR_MOVE 108

#ifndef COLLECT_RINGS_ROM
#define SE_SPIN_ATTACK 109
#else
#define SE_SPIN_ATTACK 11
#endif

#ifndef COLLECT_RINGS_ROM
#define SE_SPIN_DASH_RELEASE 110
#else
#define SE_SPIN_DASH_RELEASE 12
#endif

#define SE_SONIC_SKID_ATTACK       111
#define SE_SONIC_MIDAIR_SOMERSAULT 112
#define SE_SONIC_INSTA_SHIELD      113

#ifndef COLLECT_RINGS_ROM
#define SE_GRINDING 114
#else
#define SE_GRINDING 26
#endif

#ifndef COLLECT_RINGS_ROM
#define SE_BRAKE 115
#define SE_JUMP  116
#else
#define SE_BRAKE 13
#define SE_JUMP  14
#endif

#ifndef COLLECT_RINGS_ROM
#define SE_RING_COPY 117
#else
#define SE_RING_COPY 15
#endif

#ifndef COLLECT_RINGS_ROM
#define SE_RINGS_LOST 118
#define SE_LIFE_LOST  119
#else
#define SE_RINGS_LOST 16
#define SE_LIFE_LOST  17
#endif

#define SE_TAILS_PROPELLER_FLYING 120
#define SE_TAILS_TAIL_SWIPE       121
// 122
// 123
// 124
#define SE_125                     125
#define SE_126                     126
#define SE_127                     127
#define SE_AMY_GROUND_HAMMER       128
#define SE_AMY_SUPER_HAMMER_ATTACK 129
// 130
#define SE_AMY_HAMMER_SWIRL 131
// 132
// 133
// 134
#define SE_SA1_GOAL_POST 135
// 136
// 137
#define SE_ITEM_BOX                  138
#define SE_TIMER                     139
#define SE_STAGE_RESULT_COUNTER      140
#define SE_STAGE_RESULT_COUNTER_DONE 141
#define SE_PAUSE_SCREEN              142
#define SE_143                       143
#define SE_EXPLOSION                 144
#define SE_145                       145
#define SE_146                       146
#define SE_SPIN                      147
#define SE_148                       148
#define SE_TIME_UP                   149

#ifndef COLLECT_RINGS_ROM
#define SE_ITEM_BOX_2 150
#else
#define SE_ITEM_BOX_2 19
#endif

#define SE_ACTIVATE_SHIELD 151
#define SE_CHECKPOINT      152

#ifndef COLLECT_RINGS_ROM
#define SE_SPRING 153
#else
#define SE_SPRING 20
#endif

#ifndef COLLECT_RINGS_ROM
#define SE_SPIKES 154
#else
#define SE_SPIKES 21
#endif

#define SE_SPEED_BOOSTER         155
#define SE_WATERFALL_SURFACE_HIT 156
#define SE_157                   157
#define SE_AIR_BUBBLE            158
#define SE_ALARM_1               159
#define SE_ALARM_2               160
#define SE_ALARM_3               161
#define SE_ALARM_4               162
#define SE_ALARM_5               163
#define SE_ALARM_6               164
#define SE_ALARM_7               165
#define SE_ALARM_8               166
#define SE_ALARM_9               167
#define SE_ALARM_10              168
#define SE_SPRINGY_POLE          169
#define SE_SPRINGY_SPRING        170

/* 171 - 200: Dummies */

#define VOICE__ANNOUNCER__SONIC_ADVANCE_2 201
#define VOICE__ANNOUNCER__SONIC           202
#define VOICE__ANNOUNCER__TAILS           203
#define VOICE__ANNOUNCER__KNUCKLES        204
#define VOICE__ANNOUNCER__AMY             205
#define VOICE__ANNOUNCER__CREAM           206
// 207
#define VOICE__ANNOUNCER__3               208
#define VOICE__ANNOUNCER__2               209
#define VOICE__ANNOUNCER__1               210
#define VOICE__ANNOUNCER__GO              211
#define VOICE__ANNOUNCER__CONGRATULATIONS 212
#define SE_MAP_MOVE                       213
#define SE_MAP_214                        214
#define SE_MAP_MOVE_END                   215

#ifndef COLLECT_RINGS_ROM
#define SE_216 216
#else
#define SE_216 23
#endif

#define SE_ITEM_CONFUSION   217
#define SE_218              218
#define SE_219              219
#define SE_DELETE_GAME_DATA 220
#define SE_221              221
#define SE_222              222
// Plays when Sonic does his "Bound" trick and collides with the ground
#define SE_SONIC_BOUND_IMPACT      223
#define SE_224                     224
#define SE_SPIRAL_ATTACK           225
#define SE_226                     226
#define SE_CREAM_FLYING            227
#define SE_228                     228
#define SE_CREAM_CHEESE_ATTACK     229
#define SE_TAILS_CREAM_STOP_N_SLAM 230
#define SE_231                     231
#define SE_LONG_BRAKE              232
// 233
#define SE_234             234
#define SE_235             235
#define SE_236             236
#define SE_EGGMOBILE_FLEES 237
#define SE_238             238
#define SE_239             239
// 240
#define SE_241 241
#define SE_242 242
#define SE_243 243
#define SE_244 244
#define SE_245 245
#define SE_246 246
// 247
#define SE_PROJECTILE_DROP   248
#define SE_PROJECTILE_IMPACT 249
#define SE_250               250
#define SE_251               251
#define SE_252               252
#define SE_253               253
#define SE_254               254
#define SE_255               255
#define SE_256               256
#define SE_257               257
#define SE_258               258
#define SE_259               259
#define SE_260               260
#define SE_261               261
#define SE_262               262
#define SE_263               263
#define SE_264               264
#define SE_265               265
#define SE_266               266
#define SE_267               267
#define SE_268               268
#define SE_269               269
#define SE_SUCTION           270
#define SE_271               271
#define SE_272               272
#define SE_273               273
#define SE_274               274
#define SE_275               275

#ifndef COLLECT_RINGS_ROM
#define SE_276 276
#else
#define SE_276 25
#endif

#define SE_DASH_RING          277
#define SE_278                278
#define SE_279                279
#define SE_280                280
#define SE_281                281
#define SE_282                282
#define SE_283                283
#define SE_284                284
#define SE_WHIRLWIND          285
#define SE_286                286
#define SE_287                287
#define SE_288                288
#define SE_289                289
#define SE_POLE_SLIDING       290
#define SE_291                291
#define SE_ICE_PARADISE_SLIDE 292
#define SE_293                293
#define SE_TECHNO_BASE_COMMON 294
#define SE_295                295
#define SE_296                296
#define SE_297                297
#define SE_SPECIAL_RING       298
// 299

/* 300 - 329: Music Plant Instruments */
#define SE_MUSIC_PLANT_SPRING_1  300
#define SE_MUSIC_PLANT_SPRING_2  301
#define SE_MUSIC_PLANT_SPRING_3  302
#define SE_MUSIC_PLANT_SPRING_4  303
#define SE_MUSIC_PLANT_CRASH_HIT 304

// TODO(Jace): Name them by the note they play, instead of 1-n
#define SE_MUSIC_PLANT_NOTES_1        305
#define SE_MUSIC_PLANT_NOTES_2        306
#define SE_MUSIC_PLANT_NOTES_3        307
#define SE_MUSIC_PLANT_NOTES_4        308
#define SE_MUSIC_PLANT_NOTES_5        309
#define SE_MUSIC_PLANT_NOTES_6        310
#define SE_MUSIC_PLANT_NOTES_7        311
#define SE_MUSIC_PLANT_NOTES_8        312
#define SE_MUSIC_PLANT_GLOCKENSPIEL_1 313
#define SE_MUSIC_PLANT_GLOCKENSPIEL_2 314
#define SE_MUSIC_PLANT_GLOCKENSPIEL_3 315
#define SE_MUSIC_PLANT_GLOCKENSPIEL_4 316
#define SE_MUSIC_PLANT_GLOCKENSPIEL_5 317
#define SE_MUSIC_PLANT_GLOCKENSPIEL_6 318
#define SE_MUSIC_PLANT_ENTER_HORN     319
#define SE_MUSIC_PLANT_EXIT_HORN      320
#define SE_MUSIC_PLANT_ENTER_HORN2    321
#define SE_MUSIC_PLANT_EXIT_HORN2     322
#define SE_MUSIC_PLANT_HORN3          323
#define SE_MUSIC_PLANT_CHORD          324
#define SE_MUSIC_PLANT_PIANO          325
#define SE_MUSIC_PLANT_FLUTE_1        326
#define SE_MUSIC_PLANT_FLUTE_2        327
#define SE_MUSIC_PLANT_FLUTE_3        328
#define SE_MUSIC_PLANT_FLUTE_4        329
// 330
#define SE_331 331
#define SE_332 332
#define SE_333 333

/* 334 - 400: Dummies */

#define MUS_ACT_CLEAR     401
#define MUS_BOSS_CLEAR    402
#define MUS_FINAL_CLEAR   403
#define MUS_EXTRA_CLEAR   404
#define MUS_TIME_ATTACK_2 405
#define MUS_TIME_ATTACK_3 406
#define MUS_1_UP          407
#define MUS_MESSAGE_2     408

#define MUS_GOT_ALL_CHAOS_EMERALDS 410

#ifndef COLLECT_RINGS_ROM
#define MUS_FANFARE 411
#else
#define MUS_FANFARE 4
#endif

#define MUS_VS_EXIT    412
#define MUS_VS_SUCCESS 413
#define MUS_VS_MISS    414
#define MUS_MESSAGE    415

/* 416 - 503: Dummies */

#define MUS_504 504
#define MUS_505 505
#define MUS_506 506

#endif
