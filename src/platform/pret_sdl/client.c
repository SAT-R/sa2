#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <netdb.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <arpa/inet.h>
#include "platform/network.h"
#include "global.h"

int sockfd = 0;

char recvBuff[sizeof(NetworkPacket)];

int initClient(void)
{
    int n = 0;
    char serverAddress[] = "127.0.0.1";
    struct sockaddr_in serv_addr;

    memset(recvBuff, '0', sizeof(recvBuff));

    /* a socket is created through call to socket() function */
    if ((sockfd = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
        printf("\n Error : Could not create socket \n");
        return 1;
    }

    memset(&serv_addr, '0', sizeof(serv_addr));

    serv_addr.sin_family = AF_INET;
    serv_addr.sin_port = htons(5100);

    if (inet_pton(AF_INET, serverAddress, &serv_addr.sin_addr) <= 0) {
        printf("\n inet_pton error occured\n");
        return 1;
    }

    /* Information like IP address of the remote host and its port is
     * bundled up in a structure and a call to function connect() is made
     * which tries to connect this socket with the socket (IP address and port)
     * of the remote host
     */
    if (connect(sockfd, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0) {
        printf("\n Error : Connect Failed \n");
        return 1;
    }

    return 0;
}

void clientSend(u8 sioId, u16 data)
{
    NetworkPacket packet;
    packet.sioData = data;
    packet.sioId = sioId;
    write(sockfd, &packet, sizeof(NetworkPacket));
}

NetworkPacket *clientRecv(void)
{
    int n = 0;

    /* Once the sockets are connected, the server sends the data (date+time)
     * on clients socket through clients socket descriptor and client can read it
     * through normal read call on the its socket descriptor.
     */
    while ((n = read(sockfd, recvBuff, sizeof(NetworkPacket)) > 0)) {
        recvBuff[n] = 0;
        if (fputs(recvBuff, stdout) == EOF) {
            printf("\n Error : Fputs error\n");
        }
    }

    if (n < 0) {
        printf("\n Read error \n");
        return NULL;
    }
    return (NetworkPacket *)(&recvBuff);
}
