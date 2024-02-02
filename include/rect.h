#ifndef GUARD_RECT_H
#define GUARD_RECT_H

struct Rect8 {
    /* 0x00 */ s8 left;
    /* 0x01 */ s8 top;
    /* 0x02 */ s8 right;
    /* 0x03 */ s8 bottom;
};

#define RECT_WIDTH(hb)     ((hb)->right - (hb)->left)
#define RECT_HEIGHT(hb)    ((hb)->bottom - (hb)->top)
#define RECT_LEFT(x, hb)   ((x) + (hb)->left)
#define RECT_RIGHT(x, hb)  (RECT_LEFT(x, hb) + RECT_WIDTH(hb))
#define RECT_TOP(y, hb)    ((y) + (hb)->top)
#define RECT_BOTTOM(y, hb) (RECT_TOP(y, hb) + RECT_HEIGHT(hb))

#define RECT_COLLISION_A_X(x0, hb0, x1, hb1)                                            \
    (RECT_LEFT(x0, hb0) <= RECT_LEFT(x1, hb1)                                           \
     && RECT_RIGHT(x0, hb0) >= RECT_LEFT(x1, hb1))
#define RECT_COLLISION_B_X(x0, hb0, x1, hb1)                                            \
    (RECT_LEFT(x0, hb0) >= RECT_LEFT(x1, hb1)                                           \
     && RECT_RIGHT(x1, hb1) >= RECT_LEFT(x0, hb0))
#define RECT_COLLISION_A_Y(y0, hb0, y1, hb1)                                            \
    (RECT_TOP((y0), hb0) <= RECT_TOP((y1), hb1)                                         \
     && RECT_BOTTOM((y0), hb0) >= RECT_TOP((y1), hb1))
#define RECT_COLLISION_B_Y(y0, hb0, y1, hb1)                                            \
    (RECT_TOP((y0), hb0) >= RECT_TOP((y1), hb1)                                         \
     && RECT_BOTTOM((y1), hb1) >= RECT_TOP((y0), hb0))

#define RECT_COLLISION_X(x0, hb0, x1, hb1)                                              \
    (RECT_COLLISION_A_X(x0, hb0, x1, hb1) || RECT_COLLISION_B_X(x0, hb0, x1, hb1))
#define RECT_COLLISION_Y(y0, hb0, y1, hb1)                                              \
    (RECT_COLLISION_A_Y(y0, hb0, y1, hb1) || RECT_COLLISION_B_Y(y0, hb0, y1, hb1))

#define RECT_COLLISION(x0, y0, hb0, x1, y1, hb1)                                        \
    (RECT_COLLISION_X(x0, hb0, x1, hb1) && RECT_COLLISION_Y(y0, hb0, y1, hb1))

#endif // GUARD_RECT_H