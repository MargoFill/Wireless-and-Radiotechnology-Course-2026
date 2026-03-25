# Short Description of the Full System

Laptop 1 acts as a sensor and sends data using socket programming

Laptop 2 acts as an edge device and forwards the data using MQTT

Laptop 1 receives the MQTT data again

Grafana dashboard displays the received MQTT data

Laptop 1 (Sensor)
      │
      │ Socket
      ▼
Laptop 2 (Edge Device)
      │
      │ MQTT Publish
      ▼
MQTT Broker
      │
      │ MQTT Subscribe
      ▼
Laptop 1 (Main Server + Grafana Dashboard)

# MQTT topic used:

"savonia/iot/mareem28"

# IP Address used:

10.219.199.177

# Broker used:

tcp://broker.emqx.io:1883

# MQTT topic used:

savonia/iot/mareem

# Screenshots of the Grafana Dashboard:

<img width="1477" height="772" alt="image" src="https://github.com/user-attachments/assets/9d245a9c-ec12-46ac-9b75-9bce8120f181" />


# Short Explanation of what is shown in the panel:

The panel shows real-time MQTT data from the system(temperature readings). It shows the data for last 5 minutes in the form of graph, new data appears in the graph as new message arrive.

# Short Note about the Limitation of Live-Only MQTT Visualization

- No Historical Storage
- Data disappears if Grafana refreshes
- Cannot view past data over time
- Normally used only for real-time data monitoring

# Questions

What is the role of Grafana in this system?

- Subscribes to MQTT topics
- Displays incoming sensor data in real time
- Provides dashboards (graphs, gauges, etc.) for monitoring

Why is MQTT useful for monitoring applications?

- Works well with IoT devices
- Uses low bandwidth
- Can be easily integrated in monitoring applications like Grafana

What is the difference between live monitoring and historical storage?

Live monitoring shows the data in real-time and historical storage just store the previous data so it can be viewed later

