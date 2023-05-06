package week10.abstractfactorymethod;

import week10.abstractfactorymethod.factory.CarFactory;
import week10.abstractfactorymethod.factory.HyundaiFactory;
import week10.abstractfactorymethod.factory.TeslaFactory;
import week10.abstractfactorymethod.families.Battery;
import week10.abstractfactorymethod.families.ElectricMotor;

public class ElectricCarClient {
    public static void main(String[] args) {
        CarFactory teslaFactory = new TeslaFactory();
        ElectricMotor teslaMotor = teslaFactory.createMotor();
        Battery teslaBattery = teslaFactory.createBattery();
        System.out.println("Tesla car created with " + teslaBattery.getRange() + " miles range");
        teslaMotor.start();

        CarFactory hyundaiFactory = new HyundaiFactory();
        ElectricMotor hyundaiMotor = hyundaiFactory.createMotor();
        Battery hyundaiBattery = hyundaiFactory.createBattery();
        System.out.println("Hyundai car created with " + hyundaiBattery.getRange() + " miles range");
        hyundaiMotor.start();
    }
}

