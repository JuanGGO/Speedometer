//
// Created by juan on 10/25/20.
//


#pragma once
#include <Arduino.h>

float CalculateSpeed(float radius, float tfinal, float tinitial)
{
    return radius/(tfinal - tinitial);
}

