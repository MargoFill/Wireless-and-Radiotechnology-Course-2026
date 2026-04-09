import socket
import os

HOST = "0.0.0.0"
PORT = 5001
SAVE_FOLDER = "received_videos"

os.makedirs(SAVE_FOLDER, exist_ok=True)

server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind((HOST, PORT))
server.listen(5)

print("Receiver is waiting for files...")

while True:
    conn, addr = server.accept()
    print(f"Connected by {addr}")

    try:
        # Receive filename first
        filename = conn.recv(1024).decode().strip()
        conn.sendall(b"FILENAME_OK")

        save_path = os.path.join(SAVE_FOLDER, filename)

        with open(save_path, "wb") as f:
            buffer = b""
            while True:
                data = conn.recv(4096)
                if not data:
                    break

                buffer += data

                if b"EOF" in buffer:
                    file_data, _, remainder = buffer.partition(b"EOF")
                    f.write(file_data)
                    break

                
                if len(buffer) > 3:
                    f.write(buffer[:-3])
                    buffer = buffer[-3:]

        print(f"Received: {filename}")
        conn.sendall(b"OK")

    except Exception as e:
        print(f"Error: {e}")
        try:
            conn.sendall(b"ERROR")
        except:
            pass

    finally:
        conn.close()