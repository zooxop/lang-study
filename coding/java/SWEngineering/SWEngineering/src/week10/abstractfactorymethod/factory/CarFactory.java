package week10.abstractfactorymethod.factory;

import week10.abstractfactorymethod.families.Battery;
import week10.abstractfactorymethod.families.ElectricMotor;

public interface CarFactory {
    ElectricMotor createMotor();
    Battery createBattery();
}
