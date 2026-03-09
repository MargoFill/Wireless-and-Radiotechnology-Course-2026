
import socket
import random
import time

client = socket.socket(socket.AF_BLUETOOTH, socket.SOCK_STREAM, socket.BTPROTO_RFCOMM)

try:
    client.connect(("00:93:37:5e:95:38", 4))
    print("Connected to Bluetooth server")

    for i in range(5):
        temperature = round(random.uniform(20.0, 30.0), 1)
        message = f"Temperature: {temperature} C"
        client.send(message.encode("utf-8"))
        print("Sent:", message)
        time.sleep(5)

except OSError as e:
    print(f"Connection error: {e}")  # ← now you'll actually see the error

finally:
    client.close()