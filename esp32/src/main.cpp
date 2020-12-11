#include <Arduino.h>
#include "BluetoothSerial.h"
#include "methods.hpp"
#include <stdlib.h>

#if !defined(CONFIG_BT_ENABLED) || !defined(CONFIG_BLUEDROID_ENABLED)
#error Bluetooth is not enabled
#endif

int reedPin = 17;
int ledPin = 32;
int lecture;

//Variables for measuring time intervals
float timeBefore = 0;
float timeAfter;
float radius = 0.02;
float speed;
auto speedBin = (byte*)malloc(sizeof(float) * sizeof(byte));

BluetoothSerial SerialBT;

// For debugging
String serialbt;

void setup() {
    Serial.begin(115200);
    SerialBT.begin("Esp32Test");
    pinMode(reedPin, INPUT_PULLUP);
    pinMode(ledPin, OUTPUT);
}

void loop()
{
    lecture = digitalRead(reedPin);
    if (lecture == LOW)
    {
        timeAfter = millis();
        serialbt = SerialBT.available();
        speed = CalculateSpeed(radius, timeAfter, timeBefore);
        memcpy(speedBin, &speed, sizeof(float));
        for(int i = 0; i < sizeof(float); i++iprintln(speedBin[i], BIN);
        SerialBT.write(speedBin, sizeof(float));
        digitalWrite(ledPin, HIGH);
    }
    digitalWrite(ledPin, LOW);
    timeBefore = timeAfter;
}