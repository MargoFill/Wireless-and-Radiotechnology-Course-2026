import socket
import paho.mqtt.client as mqtt
import random
import time

broker = "broker.emqx.io"
topic1 = "savonia/iot/mareem28/temperature"
topic2 = "savonia/iot/mareem28/humidity"
topic3 = "savonia/iot/mareem28/light"


client = mqtt.Client()
client.connect(broker, 1883)

while True:
    temperature = round(random.uniform(20,30),2)
    humidity = round(random.uniform(40,80),2)
    light = round(random.uniform(100,1000),2)
    message = f"{temperature}, {humidity}, {light}"

    client.publish(topic1, temperature)
    client.publish(topic2, humidity)
    client.publish(topic3, light)

    print("Published:", message)

    time.sleep(5)