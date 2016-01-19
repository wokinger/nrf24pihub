#!/usr/bin/python
# raspberry pi nrf24l01 hub
# more details at http://blog.riyas.org
# Credits to python port of nrf24l01, Joao Paulo Barrac & maniacbugs original c library

from nrf24 import NRF24
import time
from time import gmtime, strftime
import sys
import rrdtool

import Adafruit_DHT
sensor_dht = Adafruit_DHT.DHT22
pin = 4

import Adafruit_BMP.BMP085 as BMP085

sensor_bmp = BMP085.BMP085()


# in real life data_sources would be populated in loop or something similar
data_sources=[ 'DS:temp0:GAUGE:1200:-40:40', 
               'DS:temp1:GAUGE:1200:-40:40',
               'DS:temp2:GAUGE:1200:-40:40',
               'DS:temp3:GAUGE:1200:-40:40',
               'DS:temp4:GAUGE:1200:-40:40',
               'DS:temp5:GAUGE:1200:-40:40',
               'DS:temp6:GAUGE:1200:-40:40',
               'DS:temp7:GAUGE:1200:-40:40',
               'DS:humid0:GAUGE:1200:0:100',
               'DS:humid1:GAUGE:1200:0:100',
               'DS:humid2:GAUGE:1200:0:100',
               'DS:humid3:GAUGE:1200:0:100',
               'DS:humid4:GAUGE:1200:0:100',
               'DS:humid5:GAUGE:1200:0:100',
               'DS:humid6:GAUGE:1200:0:100',
               'DS:humid7:GAUGE:1200:0:100',
               'DS:voltage0:GAUGE:1200:0:6', 
               'DS:voltage1:GAUGE:1200:0:6',
               'DS:voltage2:GAUGE:1200:0:6',
               'DS:voltage3:GAUGE:1200:0:6',
               'DS:voltage4:GAUGE:1200:0:6',
               'DS:voltage5:GAUGE:1200:0:6',
               'DS:voltage6:GAUGE:1200:0:6',
               'DS:voltage7:GAUGE:1200:0:6',
               'DS:temp:GAUGE:1200:-40:40', 
               'DS:humid:GAUGE:1200:0:100',
               'DS:pressure:GAUGE:1200:0:150000' ]

dbname = 'Weatherstation'
filename = dbname +'.rrd'
i=0
steps = 10
start = 10
#checking for existing DB
try:
    with open(filename): pass
    print "Database available: " + filename
    i=1
except IOError:
    print "No Database found, reating a new one : " + filename
    ret = rrdtool.create("%s" %(filename),
                '--step', "%s" %(steps),
                data_sources,
                'RRA:AVERAGE:0.5:1:24' ,
                'RRA:AVERAGE:0.5:6:10' ,
                'RRA:MIN:0.5:96:3600' ,
                'RRA:MAX:0.5:96:3600' ,
                'RRA:AVERAGE:0.5:96:3600' )
    i=1

def printData_all(date,time,pressure, T0,H0,V0, T1,H1,V1, T2,H2,V2, T3,H3,V3, T4,H4,V4 ):
    sys.stdout.write(str('Date: ') + date + '\n')
    sys.stdout.write(str('Time: ') + date + '\n')
    sys.stdout.write(str('Temp0: ') + T0 + '\n')
    sys.stdout.write(str('Humid0: ') + H0 + '\n')
    sys.stdout.write(str('Voltage0: ') + V0 + '\n')
    sys.stdout.write(str('Temp1: ') + T1 + '\n')
    sys.stdout.write(str('Humid1: ') + H1 + '\n')
    sys.stdout.write(str('Voltage1: ') + V1 + '\n')
    sys.stdout.write(str('Temp2: ') + T2 + '\n')
    sys.stdout.write(str('Humid2: ') + H2 + '\n')
    sys.stdout.write(str('Voltage2: ') + V2 + '\n')
    sys.stdout.write(str('Temp3: ') + T3 + '\n')
    sys.stdout.write(str('Humid3: ') + H3 + '\n')
    sys.stdout.write(str('Voltage3: ') + V3 + '\n')
    sys.stdout.write(str('Temp4: ') + T4 + '\n')
    sys.stdout.write(str('Humid4: ') + H4 + '\n')
    sys.stdout.write(str('Voltage4: ') + V4 + '\n')
    sys.stdout.write(str('Pressure: ') + pressure + '\n')
    
def printData(date,time,pressure, T0,H0,V0 ):
    sys.stdout.write(str('Date: ') + date + '\n')
    sys.stdout.write(str('Time: ') + date + '\n')
    sys.stdout.write(str('Temp: ') + T0 + '\n')
    sys.stdout.write(str('Humid: ') + H0 + '\n')
    sys.stdout.write(str('Voltage: ') + V0 + '\n')
    sys.stdout.write(str('Pressure: ') + pressure + '\n')
    
def ReadPressureSensor():

    temp = sensor_bmp.read_temperature()
    
    # Read the current barometric pressure level
    pressure = sensor_bmp.read_pressure()

    # Set the altitude of your current location in meter
    altitude = 370
    psea = pressure / pow(1.0 - altitude/44330.0, 5.255)
    #print "Temperature:           %8.2f degC" % temp
    #print "Pressure:              %8.2f hPa" % (pressure / 100.0)
    #print "Pressure at sea level: %8.2f hPa" % (psea / 100.0)
    data = str("%.2f" % temp) + "-" + str("%.2f" % psea) 
    return data
	
def ReadRaspiSensor():
    humidity, temperature = Adafruit_DHT.read_retry(sensor_dht, pin)
    #print "Temperature " + str("%.2f" % temperature) +" Humidity: " + str("%.2f" % humidity) 
    data = str("%.2f" % temperature) + "-" + str("%.2f" % humidity) 
    return data

pipes = [[0xf0, 0xf0, 0xf0, 0xf0, 0xe1], [0xf0, 0xf0, 0xf0, 0xf0, 0xd2]]
pipes = [[0xDE, 0xAD, 0xBE, 0xEF, 0xff], [0xDE, 0xAD, 0xBE, 0xEF, 0x00]]


radio = NRF24()
radio.begin(0, 0,25,18) #set gpio 25 as CE pin
radio.setRetries(15,15)
radio.setPayloadSize(14)
radio.setChannel(0x4c)
radio.setDataRate(NRF24.BR_250KBPS)
radio.setPALevel(NRF24.PA_MAX)
radio.setAutoAck(1)
radio.openWritingPipe(pipes[0])
radio.openReadingPipe(1, pipes[1])
radio.setCRCLength(NRF24.CRC_8)
radio.startListening()
radio.stopListening()

radio.printDetails()
radio.startListening()

data0 = "0:0:0"
data1 = "0:0:0"
data2 = "0:0:0"
data3 = "0:0:0"
data4 = "0:0:0"
data5 = "0:0:0"
data6 = "0:0:0"
data7 = "0:0:0"
data = ""
counter = 0;
    
while True:
    pipe = [0]
    while not radio.available(pipe, True):
        time.sleep(1000/10000.0)
    recv_buffer = []
    radio.read(recv_buffer)
    out = ''.join(chr(i) for i in recv_buffer)
    #print out
    node,  humidity, temperature, voltage = out.split("-")
    note_int = int(node)
    temperature = float(temperature) /10;
    voltage = float(voltage) / 1000;
    humidity = float(humidity) / 10;
    print " -->  Node: " + node + ", Temp: " + str(temperature) + ", Humidity: " + str(humidity) + ", Voltage: " + str(voltage)
    
    
    #create the template and data stringss    
    template = "temp" + node +  ":humid" + node + ":voltage" + node 

    template =            "temp0:humid0:voltage0:" ; 
    template = template + "temp1:humid1:voltage1:" ; 
    template = template + "temp2:humid2:voltage2:" ; 
    template = template + "temp3:humid3:voltage3:" ; 
    template = template + "temp4:humid4:voltage4:" ; 
    template = template + "temp5:humid5:voltage5:" ; 
    template = template + "temp6:humid6:voltage6:" ; 
    template = template + "temp7:humid7:voltage7:" ; 
    template = template + "temp:humid:pressure" ; 
             
    if note_int == 0 :
        data0 =  str(temperature) +  ":" + str(humidity) + ":" + str(voltage)
    elif note_int == 1 :
        counter = counter + 1;
        data1 =  str(temperature) +  ":" + str(humidity) + ":" + str(voltage)
    elif note_int == 2 :
        data2 =  str(temperature) +  ":" + str(humidity) + ":" + str(voltage)
    elif note_int == 3 :
        data3 =  str(temperature) +  ":" + str(humidity) + ":" + str(voltage)
    elif note_int == 4 :
        data4 =  str(temperature) +  ":" + str(humidity) + ":" + str(voltage)
    elif note_int == 5 :
        data5 =  str(temperature) +  ":" + str(humidity) + ":" + str(voltage)
    elif note_int == 6 :
        data6 =  str(temperature) +  ":" + str(humidity) + ":" + str(voltage)
    elif note_int == 7 :
        data7 =  str(temperature) +  ":" + str(humidity) + ":" + str(voltage)
    
    
    #cmd="rrdtool update $USER_HOME_DIR/Wetterstation/Weatherstation.rrd -t temp0:temp1:humid0:pressure  N:$dht22_temperature:$bmp_temp:$dht22_humidity:$bmp_pressure"    
    #if ()
    # store data from sensor in RRDb
    
    ## after two times data_0 update, store data 
    if counter == 3 :
        counter = 0;        
        temp_dht,humid = ReadRaspiSensor().split("-")
        temp_bmp,pressure = ReadPressureSensor().split("-")
        
        data_raspi = temp_bmp + ":" + humid + ":" + pressure
        print "Raspi_data: Temp: " + temp_bmp +" degC, Humidity: " + humid + " %, Pressure: " + pressure + " hPa"
        
        data = ""
        data = "N:" + data0 + ":" + data1 + ":" + data2 + ":" + data3 + ":" + data4 + ":" + data5 + ":" + data6 + ":" + data7 + ":" + data_raspi
        print "Update Database: " + data
        #print "with template " + template
        rrdtool.update( 'Weatherstation.rrd', '-t', "%s" %(template), "%s" %(data) )
        