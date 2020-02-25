#!/usr/bin/env python3
#
# Play around to learn how sockets works

import socket

HOST = '127.0.0.1'  # loopback ( local host )
PORT = 6646

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.bind((HOST, PORT))
    s.listen()
    conn, addr = s.accept()
    with conn:
        print('Connection by', addr)
        while True:
            data = conn.recv(1024)
            if not data:
                break
            conn.sendall(data)
