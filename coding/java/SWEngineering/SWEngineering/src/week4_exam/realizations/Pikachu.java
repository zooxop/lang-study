package week4_exam.realizations;

import week4_exam.abs.Pokemon;
import week4_exam.interfaces.Fly;
import week4_exam.interfaces.Weapon;

public class Pikachu extends Pokemon {

    public Pikachu(String name, int level, int hp, Weapon weapon, Fly fly) {
        super(name, level, hp, weapon, fly);
        this.sayHello();
    }

    @Override
    public void sayHello() {
        System.out.println("피카 피카~");
    }
}
