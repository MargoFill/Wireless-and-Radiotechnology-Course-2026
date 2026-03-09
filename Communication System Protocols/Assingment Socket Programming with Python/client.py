import socket
import time

def run_client():
    client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server_ip= "10.219.199.241"
    server_port=8000
    client.connect((server_ip, server_port))

    for i in range(5):
        msg= "Temperature: 165.3 C"
        client.send(msg.encode("utf-8")[:1024])
        response = client.recv(1024)
        response = response.decode("utf-8")

        if response.lower() == "closed":
            break
        print("Received: {response}")
        time.sleep(5)
        
    client.close()
    print("Connection to server is closed")

run_client()