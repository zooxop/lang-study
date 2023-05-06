package week10.abstractfactorymethod.factory;

import week10.abstractfactorymethod.families.Battery;
import week10.abstractfactorymethod.families.ElectricMotor;
import week10.abstractfactorymethod.families.HyundaiBattery;
import week10.abstractfactorymethod.families.HyundaiMotor;


public class HyundaiFactory implements CarFactory {
    public ElectricMotor createMotor() {
        return new HyundaiMotor();
    }

    public Battery createBattery() {
        return new HyundaiBattery();
    }
}
