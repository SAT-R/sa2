@ Optimize the following settings based on the software specifications

MULTI_SIO_BLOCK_SIZE            =   20      @ Communication Data Block Size (Max. 24 Bytes)

MULTI_SIO_PLAYERS_MAX           =   4       @ Maximum Number of Players

MULTI_SIO_SYNC_DATA             =   0xfefe  @ Synchronized Data (0x0000/0xfffa~0xffff prohibited)

@ Comment out if no space in CPU internal Work RAM
MULTI_SIO_DI_FUNC_FAST          =   1       @ SIO Interrupt Prohibit Function High Speed Flag (CPU Internal RAM Execution)


MULTI_SIO_TIMER_NO              =   3       @ Timer No.
MULTI_SIO_TIMER_INTR_FLAG       =   (INTR_FLAG_TIMER0 << MULTI_SIO_TIMER_NO)
                                            @ Timer Interrupt Flag
REG_MULTI_SIO_TIMER             =   (REG_TM0CNT + MULTI_SIO_TIMER_NO * 4)
REG_MULTI_SIO_TIMER_L           =    REG_MULTI_SIO_TIMER
REG_MULTI_SIO_TIMER_H           =   (REG_MULTI_SIO_TIMER + 2)
                                            @ Timer Register


@ Multi-play Communication Packet Structure Offset

OFS_MSP_FRAME_COUNTER           =   0       @ Frame Counter
OFS_MSP_RECV_ERROR_FLAGS        =   1       @ Receive Error Flag
OFS_MSP_CHECK_SUM               =   2       @ Checksum
OFS_MSP_DATA                    =   4       @ Communication Data
OFS_MSP_OVERRUN_CATCH           =   (OFS_MSP_DATA + MULTI_SIO_BLOCK_SIZE)
                                            @ Overrun Protect Area

MULTI_SIO_PACKET_SIZE           =   (OFS_MSP_OVERRUN_CATCH + 4)
                                            @ Structure Size


@ Multi-play Communication Work Area Structure Offset

OFS_MS_TYPE                     =   0       @ Connection (Master/Slave)
OFS_MS_STATE                    =   1       @ Communication Function State
OFS_MS_CONNECTED_FLAG           =   2       @ Connection History Flag
OFS_MS_RECV_SUCCESS_FLAGS       =   3       @ Receive Success Flag

OFS_MS_SYNC_RECV_FLAG           =   4       @ Synchronized Data Receive Confirmation Flag
OFS_MS_SYNC_RECV_ADJUST_COUNTER =   8       @ Synchronization Adjustment Counter

OFS_MS_SEND_BUF_COUNTER_INIT    =   10      @ Send Buffer Counter Initialization

OFS_MS_SYNC_SEND_FRAME_COUNTER  =   11      @ Send Frame Counter
OFS_MS_SYNC_RECV_FRAME_COUNTER  =   12      @ Receive Frame Counter

OFS_MS_SEND_BUF_COUNTER         =   20      @ Send Buffer Counter
OFS_MS_RECV_BUF_COUNTER         =   24      @ Receive Buffer Counter

OFS_MS_NEXT_SEND_BUF_P          =   40      @ Send Buffer Pointer
OFS_MS_CURRENT_SEND_BUF_P       =   44
OFS_MS_CURRENT_RECV_BUF_P       =   48      @ Receive Buffer Pointer
OFS_MS_LAST_RECV_BUF_P          =   64
OFS_MS_RECV_CHECK_BUF_P         =   80

OFS_MS_SEND_BUF                 =   96      @ Send Buffer (Double Buffer)
OFS_MS_RECV_BUF                 =   (OFS_MS_SEND_BUF + MULTI_SIO_PACKET_SIZE * 2)
                                            @ Receive Buffer (Triple Buffer)

MULTI_SIO_AREA_SIZE             =   (OFS_MS_RECV_BUF + MULTI_SIO_PACKET_SIZE * 3 * MULTI_SIO_PLAYERS_MAX)
                                            @ Structure Size

OFS_MS_HARD_ERROR               =   9
