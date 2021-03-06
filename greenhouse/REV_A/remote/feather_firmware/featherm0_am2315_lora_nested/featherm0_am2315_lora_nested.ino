
#include <SPI.h>
#include <Wire.h>

#include <RH_RF95.h> https://learn.adafruit.com/adafruit-rfm69hcw-and-rfm96-rfm95-rfm98-lora-packet-padio-breakouts/rfm9x-test
#include <Adafruit_AM2315.h> //https://learn.adafruit.com/am2315-encased-i2c-temperature-humidity-sensor/arduino-code
#include <ArduinoJson.h> //https://arduinojson.org/v6/doc/installation/

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

#define delaytime 3

 DynamicJsonDocument doc(2048);

void setup() 
{

   if (! am2315.begin()) {
     Serial.println("Sensor not found, check wiring & pullups!");
     while (1);
  }
  
  pinMode(LED, OUTPUT);
  
  pinMode(RFM95_RST, OUTPUT);
  digitalWrite(RFM95_RST, HIGH);

  Serial.begin(115200);
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
  // you can set transmitter powers from 5 to 23 dBm:
  rf95.setTxPower(23, false);
}

int16_t packetnum = 0;  // packet counter, we increment per xmission

void loop()
{

  float temperature, humidity;

  delay(2000);
  if (! am2315.readTemperatureAndHumidity(&temperature, &humidity)) {
    Serial.println("Failed to read data from AM2315");
    return;
  }
  
  delay(1000); // Wait 1 second between transmits, could also 'sleep' here!

doc["deviceId"] =  sensorID;

JsonObject fields = doc.createNestedObject("fields");

   fields["temp"]=temperature;
   fields["humid"]=humidity;
   
  char radiopacket[100];
  serializeJson(doc, radiopacket);
  
  //itoa(packetnum++, radiopacket+13, 10);
  Serial.print("Sending "); Serial.print(radiopacket); Serial.print(" ...");
  delay(10);
  
  rf95.send((uint8_t *)radiopacket, 100);

  delay(10);
  digitalWrite(LED, HIGH);
  rf95.waitPacketSent();
  digitalWrite(LED, LOW);

  Serial.println("... packet sent.");
  Serial.print("waiting ");
  Serial.print(delaytime/1000.);
  Serial.println(" sec for next sensor reading ...");
  
  delay(delaytime);
  
}
