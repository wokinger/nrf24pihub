#!/usr/bin/python
# raspberry pi nrf24l01 hub
# more details at http://blog.riyas.org
# Credits to python port of nrf24l01, Joao Paulo Barrac & maniacbugs original c library

from nrf24 import NRF24
import time
from time import gmtime, strftime

pipes = [[0xDE, 0xAD, 0xBE, 0xEF, 0xff], [0xDE, 0xAD, 0xBE, 0xEF, 11]]
#RX Address
rx_pipe = [0xDE, 0xAD, 0xBE, 0xEF, 11]
tx_pipe = [0xDE, 0xAD, 0xBE, 0xEF, 0xff]

radio = NRF24()
radio.begin(0, 0,25,18) #set gpio 25 as CE pin
radio.setRetries(15,15)
radio.setPayloadSize(32)
radio.setChannel(0x00)
radio.setCRCLength(NRF24.CRC_8)
radio.setDataRate(NRF24.BR_1MBPS)
radio.setPALevel(NRF24.PA_MAX)
radio.setAutoAck(1)
radio.openWritingPipe(tx_pipe)
radio.openReadingPipe(1, rx_pipe)

radio.startListening()
radio.stopListening()

radio.printDetails()
radio.startListening()

while True:
    pipe = [0]
    while not radio.available(pipe, True):
        time.sleep(1000/1000000.0)
        #radio.printDetails()
        
    recv_buffer = []
    radio.read(recv_buffer)
    out = ''.join(chr(i) for i in recv_buffer)
    print out
    
