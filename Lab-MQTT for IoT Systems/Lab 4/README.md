# System Architecture Diagram

Sensor (Laptop 1)

      │
      
      │ Socket
      
      ▼
      
Edge Device (Laptop 2)

      │
      
      │ MQTT Publish
      
      ▼
      
MQTT Broker

      │
      
      │ MQTT Subscribe
      
      ▼
      
Cloud Server (Laptop 1)

      │
      
      ▼
      
Telegram Alert

# MQTT topic used:

savonia/iot/mareem

# Screenshot of Telegram alert
<img width="1392" height="983" alt="telegram_bot_screen" src="https://github.com/user-attachments/assets/db9bfea3-fb2e-47be-a3ed-6084a3c18128" />

![laptop1_sending](https://github.com/user-attachments/assets/179c3caa-de00-4ac5-bf2f-731af52edbdd)

# Short explanation of how the system works

The system simulates an IoT monitoring pipeline with real-time alerting.

A temperature sensor program running on Laptop 1 generates temperature data and sends it via a socket connection to an edge device on Laptop 2. The edge device processes this data and publishes it to an MQTT broker using a specific topic.

A cloud subscriber (also on Laptop 1) listens to this MQTT topic. When a new temperature value is received, it checks whether the value exceeds a predefined threshold. If the temperature is too high, the system automatically sends a notification using a Telegram bot.

This setup demonstrates how IoT systems can collect data, process it through edge devices, and trigger real-time alerts in the cloud.


