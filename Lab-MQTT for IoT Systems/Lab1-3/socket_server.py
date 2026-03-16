import socket
import paho.mqtt.client as mqtt

HOST = "0.0.0.0"
PORT = 5000

broker = "broker.emqx.io"
topic = "savonia/iot/mareem"


server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind((HOST, PORT))
server.listen()

print("Waiting for sensor connection...")

conn, addr = server.accept()

print("Connected:", addr)

while True:

    data = conn.recv(1024)

    if not data:
        break

    print("Sensor data:", data.decode())

    mqtt_client = mqtt.Client()
    mqtt_client.connect(broker,1883)
    
    value = data.decode()

    print("Edge received:", value)

    mqtt_client.publish(topic,value)

    print("Forwarded to MQTT:", value)

    

