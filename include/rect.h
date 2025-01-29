#ifndef GUARD_RECT_H
#define GUARD_RECT_H

typedef struct {
    /* 0x00 */ s8 left;
    /* 0x01 */ s8 top;
    /* 0x02 */ s8 right;
    /* 0x03 */ s8 bottom;
} Rect8;

// TODO: Maybe the integer- and FP-macros can be merged somehow?

/* Rect collision checks using integer values */
#define RECT_WIDTH(hb)     ((hb)->right - (hb)->left)
#define RECT_HEIGHT(hb)    ((hb)->bottom - (hb)->top)
#define RECT_LEFT(x, hb)   ((x) + (hb)->left)
#define RECT_RIGHT(x, hb)  (RECT_LEFT(x, hb) + RECT_WIDTH(hb))
#define RECT_TOP(y, hb)    ((y) + (hb)->top)
#define RECT_BOTTOM(y, hb) (RECT_TOP(y, hb) + RECT_HEIGHT(hb))

#define RECT_COLLISION_A_X(x0, hb0, x1, hb1) (RECT_LEFT(x0, hb0) <= RECT_LEFT(x1, hb1) && RECT_RIGHT(x0, hb0) >= RECT_LEFT(x1, hb1))
#define RECT_COLLISION_B_X(x0, hb0, x1, hb1) (RECT_LEFT(x0, hb0) >= RECT_LEFT(x1, hb1) && RECT_RIGHT(x1, hb1) >= RECT_LEFT(x0, hb0))
#define RECT_COLLISION_A_Y(y0, hb0, y1, hb1) (RECT_TOP((y0), hb0) <= RECT_TOP((y1), hb1) && RECT_BOTTOM((y0), hb0) >= RECT_TOP((y1), hb1))
#define RECT_COLLISION_B_Y(y0, hb0, y1, hb1) (RECT_TOP((y0), hb0) >= RECT_TOP((y1), hb1) && RECT_BOTTOM((y1), hb1) >= RECT_TOP((y0), hb0))

#define RECT_COLLISION_X(x0, hb0, x1, hb1) (RECT_COLLISION_A_X(x0, hb0, x1, hb1) || RECT_COLLISION_B_X(x0, hb0, x1, hb1))
#define RECT_COLLISION_Y(y0, hb0, y1, hb1) (RECT_COLLISION_A_Y(y0, hb0, y1, hb1) || RECT_COLLISION_B_Y(y0, hb0, y1, hb1))

#define RECT_COLLISION(x0, y0, hb0, x1, y1, hb1) (RECT_COLLISION_X(x0, hb0, x1, hb1) && RECT_COLLISION_Y(y0, hb0, y1, hb1))

/* Rect collision checks using Fixed-point values */
#define Q_RECT_WIDTH(hb)      QS(RECT_WIDTH(hb))
#define Q_RECT_HEIGHT(hb)     QS(RECT_HEIGHT(hb))
#define Q_RECT_LEFT(x, hb)    ((x) + Q((hb)->left))
#define Q_RECT_LEFT2(x, hb)   QS((hb)->left + (x))
#define Q_RECT_RIGHT(x, hb)   (Q_RECT_LEFT(x, hb) + Q_RECT_WIDTH(hb))
#define Q_RECT_RIGHT2(x, hb)  (Q_RECT_LEFT2(x, hb) + Q_RECT_WIDTH(hb))
#define Q_RECT_TOP(y, hb)     (((y) + Q((hb)->top)))
#define Q_RECT_TOP2(y, hb)    QS(((hb)->top) + (y))
#define Q_RECT_BOTTOM(y, hb)  (Q_RECT_TOP(y, hb) + Q_RECT_HEIGHT(hb))
#define Q_RECT_BOTTOM2(y, hb) (Q_RECT_TOP2(y, hb) + Q_RECT_HEIGHT(hb))

#define Q_RECT_COLLISION_A_X(x0, hb0, x1, hb1)                                                                                             \
    (Q_RECT_LEFT2(x0, hb0) <= Q_RECT_LEFT(x1, hb1) && Q_RECT_RIGHT2(x0, hb0) >= Q_RECT_LEFT(x1, hb1))
#define Q_RECT_COLLISION_B_X(x0, hb0, x1, hb1)                                                                                             \
    (Q_RECT_LEFT2(x0, hb0) >= Q_RECT_LEFT(x1, hb1) && Q_RECT_RIGHT(x1, hb1) >= Q_RECT_LEFT2(x0, hb0))
#define Q_RECT_COLLISION_A_Y(y0, hb0, y1, hb1)                                                                                             \
    (Q_RECT_TOP2((y0), hb0) <= Q_RECT_TOP((y1), hb1) && Q_RECT_BOTTOM2((y0), hb0) >= Q_RECT_TOP((y1), hb1))
#define Q_RECT_COLLISION_B_Y(y0, hb0, y1, hb1)                                                                                             \
    (Q_RECT_TOP2((y0), hb0) >= Q_RECT_TOP((y1), hb1) && Q_RECT_BOTTOM((y1), hb1) >= Q_RECT_TOP2((y0), hb0))

#define Q_RECT_COLLISION_X(x0, hb0, x1, hb1) (Q_RECT_COLLISION_A_X(x0, hb0, x1, hb1) || Q_RECT_COLLISION_B_X(x0, hb0, x1, hb1))
#define Q_RECT_COLLISION_Y(y0, hb0, y1, hb1) (Q_RECT_COLLISION_A_Y(y0, hb0, y1, hb1) || Q_RECT_COLLISION_B_Y(y0, hb0, y1, hb1))

#define RECT_COLLISION_2(x0, y0, hb0, x1, y1, hb1) (Q_RECT_COLLISION_X(x0, hb0, x1, hb1) && Q_RECT_COLLISION_Y(y0, hb0, y1, hb1))

/* Rect collision checks using integer values
   Clones of the RECT_ ,macros that access values directly */
#define HB_WIDTH(hb)     ((hb).right - (hb).left)
#define HB_HEIGHT(hb)    ((hb).bottom - (hb).top)
#define HB_LEFT(x, hb)   ((x) + hb.left)
#define HB_RIGHT(x, hb)  (HB_LEFT((x), (hb)) + HB_WIDTH(hb))
#define HB_TOP(y, hb)    ((y) + hb.top)
#define HB_BOTTOM(y, hb) (HB_TOP(y, hb) + HB_HEIGHT(hb))

#define HB_COLLISION_A_X(x0, hb0, x1, hb1) (HB_LEFT(x0, hb0) <= HB_LEFT(x1, hb1) && HB_RIGHT(x0, hb0) >= HB_LEFT(x1, hb1))
#define HB_COLLISION_B_X(x0, hb0, x1, hb1) (HB_LEFT(x0, hb0) >= HB_LEFT(x1, hb1) && HB_RIGHT(x1, hb1) >= HB_LEFT(x0, hb0))
#define HB_COLLISION_A_Y(y0, hb0, y1, hb1) (HB_TOP((y0), hb0) <= HB_TOP((y1), hb1) && HB_BOTTOM((y0), hb0) >= HB_TOP((y1), hb1))
#define HB_COLLISION_B_Y(y0, hb0, y1, hb1) (HB_TOP((y0), hb0) >= HB_TOP((y1), hb1) && HB_BOTTOM((y1), hb1) >= HB_TOP((y0), hb0))

#define HB_COLLISION_X(x0, hb0, x1, hb1) (HB_COLLISION_A_X(x0, hb0, x1, hb1) || HB_COLLISION_B_X(x0, hb0, x1, hb1))
#define HB_COLLISION_Y(y0, hb0, y1, hb1) (HB_COLLISION_A_Y(y0, hb0, y1, hb1) || HB_COLLISION_B_Y(y0, hb0, y1, hb1))

#define HB_COLLISION(x0, y0, hb0, x1, y1, hb1) (HB_COLLISION_X(x0, hb0, x1, hb1) && HB_COLLISION_Y(y0, hb0, y1, hb1))

#endif // GUARD_RECT_H