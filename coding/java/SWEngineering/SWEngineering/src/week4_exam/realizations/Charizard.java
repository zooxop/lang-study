package week4_exam.realizations;

import week4_exam.abs.Pokemon;
import week4_exam.interfaces.Fly;
import week4_exam.interfaces.Weapon;

public class Charizard extends Pokemon {

    public Charizard(String name, int level, int hp, Weapon weapon, Fly fly) {
        super(name, level, hp, weapon, fly);
        this.sayHello();
    }

    @Override
    public void sayHello() {
        System.out.println("자몽 자몽!");
    }
}
