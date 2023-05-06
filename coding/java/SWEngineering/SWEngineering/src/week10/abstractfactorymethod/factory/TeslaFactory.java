package week10.abstractfactorymethod.factory;

import week10.abstractfactorymethod.families.Battery;
import week10.abstractfactorymethod.families.ElectricMotor;
import week10.abstractfactorymethod.families.TeslaBattery;
import week10.abstractfactorymethod.families.TeslaMotor;

public class TeslaFactory implements CarFactory {
    public ElectricMotor createMotor() {
        return new TeslaMotor();
    }

    public Battery createBattery() {
        return new TeslaBattery();
    }
}
