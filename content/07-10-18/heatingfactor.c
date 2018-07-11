#define MIN_ISQUARED 1

bool heatingfactor(double junctionTemp, double ambientTemp, double current,
                   double* result) {
    double iSquared = current * current;
    if(iSquared <= MIN_ISQUARED)
        return false;

    *result = (junctionTemp - ambientTemp) / iSquared;
    return true; 
}
