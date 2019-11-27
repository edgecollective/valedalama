import board
import busio
import digitalio
from digitalio import DigitalInOut
import time
import gc

# Get Wifi and FarmOS details
try:
    from secrets import secrets
except ImportError:
    print("WiFi secrets are kept in secrets.py, please add them there!")
    raise

WIFI_ESSID=secrets['ssid']
WIFI_PASS=secrets['password']
farmos_pubkey=secrets['farmos_pubkey']
farmos_privkey=secrets['farmos_privkey']

base_url= "https://edgecollective.farmos.net/farm/sensor/listener/"

JSON_POST_URL = base_url+farmos_pubkey+"?private_key="+farmos_privkey

# esp32

import adafruit_esp32spi.adafruit_esp32spi_socket as socket
from adafruit_esp32spi import adafruit_esp32spi
import adafruit_requests as requests


esp32_cs = DigitalInOut(board.D12)
esp32_ready = DigitalInOut(board.D11)
esp32_reset = DigitalInOut(board.D10)

esp_spi = busio.SPI(board.SCK, board.MOSI, board.MISO)
esp = adafruit_esp32spi.ESP_SPIcontrol(esp_spi, esp32_cs, esp32_ready, esp32_reset)


def connect(essid,password): # note that these are arguments are b'essid' and b'password'
    print("Connecting to AP...")
    while not esp.is_connected:
        try:
            esp.connect_AP(essid, password)
        except RuntimeError as e:
            print("could not connect to AP, retrying: ",e)
            continue
    print("Connected to", str(esp.ssid, 'utf-8'), "\tRSSI:", esp.rssi)

    # Initialize a requests object with a socket and esp32spi interface
    requests.set_socket(socket, esp)

# lora

import adafruit_rfm9x

TIMEOUT=5

#lora_spi = busio.SPI(board.D13, MOSI=board.D11, MISO=board.D12)

cs = digitalio.DigitalInOut(board.D9)
reset = digitalio.DigitalInOut(board.D7)

rfm9x = adafruit_rfm9x.RFM9x(esp_spi, cs, reset, 915.0)

# connect to wifi



# main loop
f
while True:

    gc.collect()

    
    print("radio waiting ...")
    packet = rfm9x.receive(timeout=TIMEOUT)

    if packet is not None:
        try:
            pt = str(packet,  "utf-8")
            print("Received: ",pt)
            pl=pt.strip().split(',')
            if len(pl)==4:
                temp=pl[0]
                humidity=pl[1]
                pressure=pl[2]
                ground_temp=pl[3]
                    
                json_data = {"temp" : temp,"humidity" : humidity, "pressure" : pressure,"ground_temp":ground_temp}

                print("Posting to ",JSON_POST_URL)
                connect(WIFI_ESSID,WIFI_PASS)

                response = requests.post(JSON_POST_URL, json=json_data)
                #print(response.content)

                response.close()

                print("Done. Sleeping for 90 sec")
                time.sleep(90)

        except Exception as e:
                print("error: "+str(e))