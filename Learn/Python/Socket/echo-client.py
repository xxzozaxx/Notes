#!/usr/bin/env python3
#
# Play around to learn how sockets works

import socket

HOST = '127.0.0.1'  # loopback ( local host )
PORT = 6646

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.connect((HOST, PORT))
    s.sendall(b'Hello, world!')
    data = s.recv(1024)

print('Received', repr(data))
print('EOP')
