
#include <SPI.h>
#include <Wire.h>
#include "ArduinoLowPower.h"
#include <RH_RF95.h> https://learn.adafruit.com/adafruit-rfm69hcw-and-rfm96-rfm95-rfm98-lora-packet-padio-breakouts/rfm9x-test
#include <Adafruit_AM2315.h> //https://learn.adafruit.com/am2315-encased-i2c-temperature-humidity-sensor/arduino-code
#include <ArduinoJson.h> //https://arduinojson.org/v6/doc/installation/
#include <Adafruit_SleepyDog.h>


#define watchdog_interval 16000 // milliseconds
#define wake_number_max 5

#define sleeptime 3000

volatile bool alarmFlag = false; // Start awake

Adafruit_AM2315 am2315;

// for feather m0  
#define RFM95_CS 8
#define RFM95_RST 4
#define RFM95_INT 3

// Change to 434.0 or other frequency, must match RX's freq!
#define RF95_FREQ 915.0

// Singleton instance of the radio driver
RH_RF95 rf95(RFM95_CS, RFM95_INT);

#define LED 13

#define sensorID 22



void setup() 
{

//int countdownMS = Watchdog.enable(watchdog_interval); // max 16 seconds, try 10


   if (! am2315.begin()) {
     Serial.println("Sensor not found, check wiring & pullups!");
     while (1);
  }

  Serial.println("startup good!");
  
  pinMode(LED, OUTPUT);
  
  pinMode(RFM95_RST, OUTPUT);
  digitalWrite(RFM95_RST, HIGH);

  Serial.begin(9600);
  /*while (!Serial) {
    delay(1);
  }
  */

  delay(100);

  Serial.println("Feather LoRa TX Test!");

  // manual reset
  digitalWrite(RFM95_RST, LOW);
  delay(10);
  digitalWrite(RFM95_RST, HIGH);
  delay(10);

  while (!rf95.init()) {
    Serial.println("LoRa radio init failed");
    Serial.println("Uncomment '#define SERIAL_DEBUG' in RH_RF95.cpp for detailed debug info");
    while (1);
  }
  Serial.println("LoRa radio init OK!");

  // Defaults after init are 434.0MHz, modulation GFSK_Rb250Fd250, +13dbM
  if (!rf95.setFrequency(RF95_FREQ)) {
    Serial.println("setFrequency failed");
    while (1);
  }
  Serial.print("Set Freq to: "); Serial.println(RF95_FREQ);
  
  // Defaults after init are 434.0MHz, 13dBm, Bw = 125 kHz, Cr = 4/5, Sf = 128chips/symbol, CRC on

  // The default transmitter power is 13dBm, using PA_BOOST.
  // If you are using RFM95/96/97/98 modules which uses the PA_BOOST transmitter pin, then 
  
  
}

int16_t packetnum = 0;  // packet counter, we increment per xmission

int wake_counter = 0;

void loop()
{

        Watchdog.reset();

  digitalWrite(LED, HIGH);
delay(10);
digitalWrite(LED, LOW);
delay(10);

    wake_counter=wake_counter+1;
    
    if (wake_counter > wake_number_max) {
    wake_counter=0;
    
float temperature, humidity;

  delay(2000);
  if (! am2315.readTemperatureAndHumidity(&temperature, &humidity)) {
    Serial.println("Failed to read data from AM2315");
    return;
  }
  
  delay(1000); // Wait 1 second between transmits, could also 'sleep' here!

StaticJsonDocument<1024> doc;

   doc["sensorID"]=sensorID;
   doc["temp"]=temperature;
   doc["humid"]=humidity;
   
  char radiopacket[60];
  serializeJson(doc, radiopacket);
  
  //itoa(packetnum++, radiopacket+13, 10);
  Serial.print("Sending "); Serial.print(radiopacket); Serial.print(" ...");
  delay(10);
  
  rf95.send((uint8_t *)radiopacket, 60);
  rf95.waitPacketSent();
  for (int j=0;j<3;j++) {
    digitalWrite(LED, HIGH);
delay(100);
digitalWrite(LED, LOW);
delay(100);
  }
  
  
    rf95.sleep();
    LowPower.sleep(sleeptime);

}

}

void dummy() {
  // This function will be called once on device wakeup
  // You can do some little operations here (like changing variables which will be used in the loop)
  // Remember to avoid calling delay() and long running functions since this functions executes in interrupt context
}
