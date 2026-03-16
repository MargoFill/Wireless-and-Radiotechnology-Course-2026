# System Architecture Diagram

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

# IP Address used:

10.219.199.177

# MQTT topic used:

savonia/iot/mareem

# Screenshots of socket and mqtt communication:

<img width="1918" height="1138" alt="socket_mqtt_server_side" src="https://github.com/user-attachments/assets/847b0d44-b610-40e4-8740-91aa0a622459" />



![laptop1_comm](https://github.com/user-attachments/assets/81e081ff-9c2d-4ae2-91fd-6db81c447f08)





