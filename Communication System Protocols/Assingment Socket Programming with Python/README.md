# Project description

This project demonstrates a basic TCP client–server communication system using Python sockets. The system simulates a sensor sending temperature data to a server. The server listens for incoming connections and prints the received messages. The client connects to the server and sends randomly generated temperature values every 5 seconds, mimicking data from a real IoT sensor. This project was created to practice:

1) Python socket programming

2) TCP networking fundamentals

3) Client–server communication

4) Testing network applications across devices


# How to Run the Project
## 1. Start the Server

Open a terminal in the project folder and run:

python server.py

The server will start listening for incoming connections.

## 2. Start the Client

Open another terminal window and run:

python client.py
