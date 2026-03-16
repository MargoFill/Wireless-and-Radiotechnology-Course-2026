<img width="1917" height="1137" alt="image" src="https://github.com/user-attachments/assets/1ede02a5-4598-4283-a049-594977e7743e" /># System Architecture Diagram

+------------------+
|  Sensor Device   |
|  (socket_sensor) |
+------------------+
          |
          | TCP Socket
          v
+------------------+
|   Edge Server    |
|  (socket_server) |
+------------------+
          |
          | MQTT Publish
          v
+------------------+
|   MQTT Broker    |
|   broker.emqx.io |
+------------------+
          |
          | MQTT Subscribe
          v
+------------------+
| Cloud Subscriber |
| (mqtt_subscriber)|
+------------------+




