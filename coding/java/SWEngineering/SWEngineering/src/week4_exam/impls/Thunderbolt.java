package week4_exam.impls;

import week4_exam.abs.Pokemon;
import week4_exam.interfaces.Weapon;

public class Thunderbolt implements Weapon {

    @Override
    public void attack(Pokemon pokemon) {
        System.out.println("전기를 " + pokemon.getName() + "에게 내뿜습니다!");
    }
}
