/*
  TimedWakeup

  This sketch demonstrates the usage of Internal Interrupts to wakeup a chip in sleep mode.
  Sleep modes allow a significant drop in the power usage of a board while it does nothing waiting for an event to happen. Battery powered application can take advantage of these modes to enhance battery life significantly.

  In this sketch, the internal RTC will wake up the processor every 2 seconds.
  Please note that, if the processor is sleeping, a new sketch can't be uploaded. To overcome this, manually reset the board (usually with a single or double tap to the RESET button)

  This example code is in the public domain.
*/
#include <SPI.h>
#include <Wire.h>
#include <RH_RF95.h> https://learn.adafruit.com/adafruit-rfm69hcw-and-rfm96-rfm95-rfm98-lora-packet-padio-breakouts/rfm9x-test
#include "ArduinoLowPower.h"
#include <Adafruit_SleepyDog.h>
#include <Adafruit_AM2315.h> //https://learn.adafruit.com/am2315-encased-i2c-temperature-humidity-sensor/arduino-code
#include <ArduinoJson.h> //https://arduinojson.org/v6/doc/installation/



int sleep_interval = 5000; //milliseconds

#define watchdog_interval 16000 // milliseconds

int wake_counter_max = 2; // for 10 seconds
//int wake_counter_max = 60; // for 5 minutes
//int wake_counter_max = 120; // for 10 minutes
int wake_counter = 0;
// note: total sleep time is sleep_interval*wake_counter_max

// for feather m0  
#define RFM95_CS 8
#define RFM95_RST 4
#define RFM95_INT 3

// Change to 434.0 or other frequency, must match RX's freq!
#define RF95_FREQ 915.0

// Singleton instance of the radio driver
RH_RF95 rf95(RFM95_CS, RFM95_INT);

Adafruit_AM2315 am2315;

#define sensorID 22

int sensor_working = 0;  // flag for whether sensor was working
int max_sensor_attempts = 10;

void setup() {

  int countdownMS = Watchdog.enable(watchdog_interval); // max 16 seconds, try 10

  Serial.print("Watchdog enabled! interval (ms): ");
  Serial.println(watchdog_interval);
  
  Serial.begin(9600);
  while(!Serial) {
    ;
  }

    Serial.println("-----Starting up!----\n");

  sensor_working = am2315.begin();

  if(!sensor_working) {
    Serial.println("sensor not working -- check wiring?");
  }

  while (!sensor_working) {
  digitalWrite(LED_BUILTIN, HIGH);
  delay(50);
  digitalWrite(LED_BUILTIN, LOW);
  delay(50);
  }
 
  Serial.print("sensor works!");
  
  pinMode(LED_BUILTIN, OUTPUT);
  // Uncomment this function if you wish to attach function dummy when RTC wakes up the chip
  // LowPower.attachInterruptWakeup(RTC_ALARM_WAKEUP, dummy, CHANGE);

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
  // you can set transmitter powers from 5 to 23 dBm:
  rf95.setTxPower(23, false);
  rf95.sleep();

  
}

void loop() {
  Watchdog.reset();

  if (wake_counter==0) { // then read the sensor and send
    
float temperature, humidity;
int sensor_read_status=0;

  delay(2000);
  sensor_read_status=am2315.readTemperatureAndHumidity(&temperature, &humidity);

    while (!sensor_read_status) {
  digitalWrite(LED_BUILTIN, HIGH);
  delay(50);
  digitalWrite(LED_BUILTIN, LOW);
  delay(50);
  }

    // send packet via radio
    Serial.println("sensor worked!");

    StaticJsonDocument<1024> doc;

   doc["sensorID"]=sensorID;
   doc["temp"]=temperature;
   doc["humid"]=humidity;
   
  char radiopacket[60];
  serializeJson(doc, radiopacket);
  
  //itoa(packetnum++, radiopacket+13, 10);
  Serial.print("Sending "); Serial.print(radiopacket); Serial.println(" ...");
  delay(10);
  
  rf95.send((uint8_t *)radiopacket, 60);
  rf95.waitPacketSent();
  rf95.sleep();
  

  for (int j=0;j<2;j++) {
    digitalWrite(LED_BUILTIN, HIGH);
  delay(100);
  digitalWrite(LED_BUILTIN, LOW);
  delay(100);
  }
  
  }

  wake_counter=wake_counter+1;
  if (wake_counter>=wake_counter_max) {
    wake_counter=0;
  }

  
  digitalWrite(LED_BUILTIN, HIGH);
  delay(50);
  digitalWrite(LED_BUILTIN, LOW);
  delay(50);

  Serial.println("sleep chunk ...");
   //LowPower.sleep(sleep_interval);
   delay(sleep_interval);
   
  rf95.sleep();
}
