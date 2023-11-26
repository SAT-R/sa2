#ifndef GUARD_STAGE_DEBUG_TEXT_PRINTER_H
#define GUARD_STAGE_DEBUG_TEXT_PRINTER_H

extern struct Task *Debug_CreateAsciiTask(s16 x, s16 y);
extern void Debug_PrintIntegerAt(u32 value, u16 x, u16 y);
extern void Debug_PrintTextAt(char *value, u16 x, u16 y);

#endif // GUARD_STAGE_DEBUG_TEXT_PRINTER_H
