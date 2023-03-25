package week4_exam.impls;

import week4_exam.abs.Pokemon;
import week4_exam.interfaces.Weapon;

public class BubbleBeam implements Weapon {
    @Override
    public void attack(Pokemon pokemon) {
        System.out.println("거품광선을 " + pokemon.getName() + "에게 발사합니다!");
    }
}
