# Description of all sensors used

We used 3 sensors in this lab: temperature sensor, humidity sensor and light sensor

# MQTT topics used:

topic1 = "savonia/iot/mareem28/temperature"

topic2 = "savonia/iot/mareem28/humidity"

topic3 = "savonia/iot/mareem28/light"

# Screenshot of 5-panel board

<img width="1917" height="968" alt="image" src="https://github.com/user-attachments/assets/5f184f76-daa1-46b6-a95b-79ef4aefdc7e" />

# Explanation of Dashboard Layout
- Temperature Graph
- Humidity Gauge
- Light Gauge
- Temperature Sensor Status
- Humidity Sensor Status


Why do we separate each sensor into a different MQTT topic?

- Because we need to identify every sensor separately, so we can assign each sensor to its panel separately from other sensors data

