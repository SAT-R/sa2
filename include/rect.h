#ifndef GUARD_RECT_H
#define GUARD_RECT_H

struct Rect8 {
    /* 0x00 */ s8 left;
    /* 0x01 */ s8 top;
    /* 0x02 */ s8 right;
    /* 0x03 */ s8 bottom;
};

// TODO: Maybe the integer- and FP-macros can be merged somehow?

/* Rect collision checks using integer values */
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

/* Rect collision checks using Fixed-point values */
#define RECT_QWIDTH(hb)      Q_24_8_NEW(RECT_WIDTH(hb))
#define RECT_QHEIGHT(hb)     Q_24_8_NEW(RECT_HEIGHT(hb))
#define RECT_QLEFT(x, hb)    ((x) + Q_24_8((hb)->left))
#define RECT_QLEFT2(x, hb)   Q_24_8_NEW((hb)->left + (x))
#define RECT_QRIGHT(x, hb)   (RECT_QLEFT(x, hb) + RECT_QWIDTH(hb))
#define RECT_QRIGHT2(x, hb)  (RECT_QLEFT2(x, hb) + RECT_QWIDTH(hb))
#define RECT_QTOP(y, hb)     (((y) + Q_24_8((hb)->top)))
#define RECT_QTOP2(y, hb)    Q_24_8_NEW(((hb)->top) + (y))
#define RECT_QBOTTOM(y, hb)  (RECT_QTOP(y, hb) + RECT_QHEIGHT(hb))
#define RECT_QBOTTOM2(y, hb) (RECT_QTOP2(y, hb) + RECT_QHEIGHT(hb))

#define RECT_QCOLLISION_A_X(x0, hb0, x1, hb1)                                           \
    (RECT_QLEFT2(x0, hb0) <= RECT_QLEFT(x1, hb1)                                        \
     && RECT_QRIGHT2(x0, hb0) >= RECT_QLEFT(x1, hb1))
#define RECT_QCOLLISION_B_X(x0, hb0, x1, hb1)                                           \
    (RECT_QLEFT2(x0, hb0) >= RECT_QLEFT(x1, hb1)                                        \
     && RECT_QRIGHT(x1, hb1) >= RECT_QLEFT2(x0, hb0))
#define RECT_QCOLLISION_A_Y(y0, hb0, y1, hb1)                                           \
    (RECT_QTOP2((y0), hb0) <= RECT_QTOP((y1), hb1)                                      \
     && RECT_QBOTTOM2((y0), hb0) >= RECT_QTOP((y1), hb1))
#define RECT_QCOLLISION_B_Y(y0, hb0, y1, hb1)                                           \
    (RECT_QTOP2((y0), hb0) >= RECT_QTOP((y1), hb1)                                      \
     && RECT_QBOTTOM((y1), hb1) >= RECT_QTOP2((y0), hb0))

#define RECT_QCOLLISION_X(x0, hb0, x1, hb1)                                             \
    (RECT_QCOLLISION_A_X(x0, hb0, x1, hb1) || RECT_QCOLLISION_B_X(x0, hb0, x1, hb1))
#define RECT_QCOLLISION_Y(y0, hb0, y1, hb1)                                             \
    (RECT_QCOLLISION_A_Y(y0, hb0, y1, hb1) || RECT_QCOLLISION_B_Y(y0, hb0, y1, hb1))

#define RECT_COLLISION_2(x0, y0, hb0, x1, y1, hb1)                                      \
    (RECT_QCOLLISION_X(x0, hb0, x1, hb1) && RECT_QCOLLISION_Y(y0, hb0, y1, hb1))

#endif // GUARD_RECT_H