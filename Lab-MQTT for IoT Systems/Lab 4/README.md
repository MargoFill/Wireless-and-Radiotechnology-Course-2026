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


