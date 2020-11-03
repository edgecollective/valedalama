#include <U8x8lib.h>
#include <WiFi.h>
#include <HTTPClient.h>
#include <ArduinoJson.h>
#include <SPI.h>
#include <RH_RF95.h>

#define RFM95_CS 18
#define RFM95_RST 14
#define RFM95_INT 26

// Change to 434.0 or other frequency, must match RX's freq!
#define RF95_FREQ 915.0

// Singleton instance of the radio driver
RH_RF95 rf95(RFM95_CS, RFM95_INT);

String receivedText;
String receivedRssi;

const char* ssid = "InmanSquareOasis";
const char* password = "portauprince";


//const char* serverName = "https://edgecollective.farmos.net/farm/sensor/listener/47803f44fef9cf01489d033d2eef4424?private_key=9f6a52fb667566b828069794274fad22";

const char* serverName = "https://edgecollective.farmos.net/farm/sensor/listener/2baa36b4c0b410de72ffdd97917cb05d?private_key=97493f4173a2e8a761f27ac2018ef180";

// the following variables are unsigned longs because the time, measured in
// milliseconds, will quickly become a bigger number than can be stored in an int.

unsigned long lastTime = 0;
// Timer set to 10 minutes (600000)
//unsigned long timerDelay = 600000;
// Set timer to 90 seconds (5000)
unsigned long timerDelay = 90000;

StaticJsonDocument<200> doc;



int postcount = 0;

U8X8_SSD1306_128X64_NONAME_SW_I2C u8x8(/* clock=*/ 15, /* data=*/ 4, /* reset=*/ 16);

int latest_temp_19 = 0.;
int latest_ppm_19 = 0.;
int latest_ppm_30 = 0;

void setup() {

  u8x8.begin();
  u8x8.setFont(u8x8_font_chroma48medium8_r);

  u8x8.drawString(0, 0, "FarmOS Client!");


  Serial.begin(9600);


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

  rf95.setTxPower(23, false);


  WiFi.begin(ssid, password);
  Serial.println("Connecting");
   u8x8.drawString(0, 1, "WiFi connecting ...");
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.print("Connected to WiFi network with IP Address: ");
 
  u8x8.drawString(0, 1, "WiFi connected.");

  Serial.println(WiFi.localIP());

  Serial.println("Timer set to 5 seconds (timerDelay variable), it will take 5 seconds before publishing the first reading.");
}

void loop() {

  if (rf95.available())
  {

    // Should be a message for us now
    uint8_t buf[RH_RF95_MAX_MESSAGE_LEN];
    uint8_t len = sizeof(buf);

    if (rf95.recv(buf, &len))
    {
      RH_RF95::printBuffer("Received: ", buf, len);
      Serial.print("Got: ");
      Serial.println((char*)buf);
      Serial.print("RSSI: ");
      Serial.println(rf95.lastRssi(), DEC);

      u8x8.drawString(0, 4, (char*)buf);


      DeserializationError error = deserializeJson(doc, (char*)buf);

      if (error) {
        Serial.print(F("deserializeJson() failed: "));
        Serial.println(error.c_str());
        return;
      }

      Serial.println("Parsed JSON:");
      serializeJsonPretty(doc, Serial);
      Serial.println();

      Serial.print( (timerDelay - (millis() - lastTime)) / 1000.);
      Serial.println(" sec remain til next POST");

      if ( ( (millis() - lastTime) > timerDelay) || (postcount == 0)) {

        if (WiFi.status() == WL_CONNECTED) {
          HTTPClient http;

          // Your Domain name with URL path or IP address with path
          http.begin(serverName);

          http.addHeader("Content-Type", "application/json");

          String output;
          serializeJson(doc, output);

          int httpResponseCode = http.POST(output);


          Serial.print("HTTP Response code: ");
          Serial.println(httpResponseCode);

          postcount = postcount + 1;

          // Free resources
          http.end();

        }
        else {
          Serial.println("WiFi Disconnected");
        }
        lastTime = millis();

      }

/*
      // Send a reply
      uint8_t data[] = "And hello back to you";
      rf95.send(data, sizeof(data));
      rf95.waitPacketSent();
      Serial.println("Sent a reply");
      */
    }
    else
    {
      Serial.println("Receive failed");
    }

  }

}
