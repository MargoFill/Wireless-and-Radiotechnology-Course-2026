import socket
import paho.mqtt.client as mqtt

HOST = "0.0.0.0"
PORT = 5000

broker = "broker.emqx.io"
topic1 = "savonia/iot/mareem28/temperature"
topic2 = "savonia/iot/mareem28/humidity"
topic3 = "savonia/iot/mareem28/light"


mqtt_client = mqtt.Client()
mqtt_client.connect(broker,1883)

server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind((HOST, PORT))
server.listen()

print("Edge device waiting for sensor...")

conn, addr = server.accept()

print("Sensor connected:", addr)

while True:

    data = conn.recv(1024)

    if not data:
        break

    message = data.decode()

    temperature, humidity, light = message.split(",")

    mqtt_client.publish("savonia/iot/mareem28/temperature", temperature)
    mqtt_client.publish("savonia/iot/mareem28/humidity", humidity)
    mqtt_client.publish("savonia/iot/mareem28/light", light)

    print("Forwarded:", message)

    

