#include <WiFi.h>
#include <WiFiClientSecure.h>
#include <MQTT.h>
#include "DHT.h"
#include <ArduinoJson.h>

// Contantes para conexión a la red
// Recuerda cambiar las credenciales de red
const char* WIFI_SSID = "UpDgo";
const char* WIFI_PASS = "";

// Constantes para conexión a MQTT
const char* MQTT_CLIENT_ID = "esp32";
const char* MQTT_BROKER_URL = "42d781b728f04fe298fc42085d5f5ca5.s1.eu.hivemq.cloud";
const char* MQTT_USER = "Axel_11";
const char* MQTT_PASS = "Cisco123";
const char* MQTT_TOPIC = "temperatura/humedad";
const int MQTT_PORT = 8883;

// Constantes de DHT11
const int DHT11_PIN = 2;
DHT dht11(DHT11_PIN, DHT11);

// Cliente web
WiFiClientSecure espClient;
// Cliente MQTT
MQTTClient client;

void conectarseBrokerMQTT() {
  Serial.println("Conectarse al broker de MQTT por Websocket...");

  // TODO: Intentar usar certificados
  espClient.setInsecure();
  client.begin(MQTT_BROKER_URL, MQTT_PORT, espClient);

  bool ok;
  while (!client.connected()) {
    ok = client.connect(MQTT_CLIENT_ID, MQTT_USER, MQTT_PASS);
    if (ok) {
      Serial.println("Se conecto exitosamente");
    }
  }
}

void conectarseRed() {
  WiFi.mode(WIFI_STA);
  WiFi.begin(WIFI_SSID, WIFI_PASS);

  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(100);
  }

  Serial.print("\nConectado a la red: ");
  Serial.println(WIFI_SSID);
  Serial.print("Local ESP32 IP: ");
  Serial.println(WiFi.localIP());
}

void setup() {
  Serial.begin(115200);
  conectarseRed();
  conectarseBrokerMQTT();
  dht11.begin();
}

int temp_before;
int hum_before;

void loop() {
  if (!client.connected()) {
    conectarseBrokerMQTT();
  }

  client.loop();

  // TEMPORAL
  float temp = dht11.readHumidity();
  float hum = dht11.readHumidity();

  if (temp != temp_before || hum != hum_before) {
    temp_before = temp;
    hum_before = hum;

    Serial.print("Temperatura: ");
    Serial.println(temp);
    Serial.print("Humedad: ");
    Serial.println(hum);

    // Objeto para serializar a JSON
    JsonDocument doc;

    doc["temp"] = temp;
    doc["hum"] = hum;

    char output[256];
    serializeJson(doc, output);

    client.publish(MQTT_TOPIC, output);
  }
  delay(1000);
}
