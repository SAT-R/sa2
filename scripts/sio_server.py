import socket
import threading

HEADER = 64
PORT = 5100
SERVER = "127.0.0.1"
print(SERVER)
ADDR = (SERVER, PORT)
FORMAT = 'UTF-8'

server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind(ADDR)

clients: list[socket.socket] = []

def handle_client(conn, addr):
    print(f"[NEW CONNECTION] {addr} connected.")
    connected = True
    while connected:
        msg = conn.recv(17)
       
        if len(msg) < 17:
            break
        
        print("Broadcasting", msg)
        
        #for client in clients:
            #client.send(msg)
        
        print(f"[{addr}] {msg}")

    clients.remove(conn)
    conn.close()


def start():
    server.listen()
    print(f"[LISTENING] Server is listening on {SERVER}")
    while True:
        conn, addr = server.accept()
        clients.append(conn)
        thread = threading.Thread(target=handle_client, args=(conn, addr))
        thread.start()
        print(f"[ACTIVE CONNECTIONS] {threading.activeCount() - 1}")


print("[STARTING] server is starting...")
start()
