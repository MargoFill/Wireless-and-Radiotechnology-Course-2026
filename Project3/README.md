 RF System Decomposition
 =
 
Student name and ID: Margarita Filenko - s2312635

Selected device name: LoRa Node - Semtech SX1276

Datasheet link: https://semtech.my.salesforce.com/sfc/p/#E0000000JelG/a/2R0000001Rbr/6EfVZUorrpoKFfvaF_Fkpgp5kzjiNyiAbqcpqh9qSjE

Short explanation of each RF block:
--
1) Information Source / MCU

The SX1276 itself is not a microcontroller — it is a transceiver IC.

An external MCU (e.g., STM32, AVR, etc.) normally provides data to send and processes received data, configures registers, and controls operation over an SPI interface. These high-level tasks (packet formatting, timing, MAC logic) are done outside the SX1276 in the host microcontroller.

Role: Data flow and system control; interfaces to SX1276 via SPI.

2) RF Transceiver (Tx/Rx functionality)

The core of the SX1276 is a half-duplex RF transceiver that integrates both transmit and receive chains covering ~137–1020 MHz.

It has an RF front end that handles frequency conversion, filtering, and signal conditioning.

In receive mode, the RF signal is captured and down-converted; in transmit mode, baseband data is up-converted and sent to the PA.

Signal Flow: Antenna → LNA/mixer → demodulator → digital baseband (Rx)
Tx: digital baseband → modulator → up-converter → PA → antenna.

3) Modulation / Demodulation (Conceptual)

The SX1276 includes digital modulation/demodulation for both LoRa and legacy schemes (FSK/OOK).

LoRa modulation uses spread spectrum techniques for long range and resilience.

In FSK/OOK mode, conventional frequency/shift keying or on-off keying is supported.

Modulation happens digitally within the transceiver modem block, controlled by MCU registers.

Conceptually: Bits → digital modulator (LoRa/FSK/OOK) → RF waveform for Tx;
Reverse in Rx.

4) Power Amplifier (PA)

The SX1276 integrates multiple PAs with different outputs:
• PA_HF/LF: ~ +14 dBm for normal output.
• PA_BOOST (High-Power): up to ~ +20 dBm for stronger transmissions, selectable via register settings.

PA is part of the transmit chain, boosting the RF signal before the antenna.

PA Supply: Dedicated pin and internal bias circuitry (VR_PA).

5) Low Noise Amplifier (LNA)

The receive chain starts with an integrated LNA to amplify weak incoming signals with low added noise.

LNA ensures sensitivity (down to ~-148 dBm) by boosting the RF before further processing.

Role: Improves Rx sensitivity and reduces receiver noise floor.

6) RF Filtering / Matching Network

Internally, the SX1276 has implicit RF front-end filtering and matching tailored to frequency bands.

It interfaces to external matching network components (inductors/capacitors) on the PCB to match 50 Ω antenna impedance and to shape the bandpass.

External filters (e.g., SAW/ceramic) are often added for regulatory compliance and spurious suppression.

Note: The datasheet shows internal RF blocks; actual antenna match networks are external.

7) Antenna Interface

The final RF output from PA and the LNA receive input are typically connected to a common antenna node via a T/R switch or matching network in the surrounding hardware design.

Pins like RFO_LF / RFO_HF / PA_BOOST are connected to the external RF trace → matching → SMA/PCB antenna.

Function: Physical connection to air for RF transmission/reception.

8) Power Supply for RF Section

The SX1276 has several supply pins and internal regulation:
• VBAT_RF / VBAT_ANA — analog/RF supplies.
• VR_PA — regulated supply for the PA.

It may include internal regulators and requires decoupling capacitors for noise suppression.

Power Characteristics: Typically operates from ~1.8–3.7 V (with PA power scaled accordingly).
