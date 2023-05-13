#include "global.h"
#include "loader_tables.h"

#define UNKNOWN_BUF_1 ((void *)EWRAM_START + 0x28000)
#define UNKNOWN_BUF_2 ((void *)EWRAM_START + 0x30000)

void *const gUnknown_0203C280[] = {
    PROGRAM_WORK_BUFFER, UNKNOWN_BUF_1, UNKNOWN_BUF_2, PROGRAM_WORK_BUFFER, RECV_BUFFER,
    RECV_BUFFER,         RECV_BUFFER,   RECV_BUFFER,   RECV_BUFFER,
};
