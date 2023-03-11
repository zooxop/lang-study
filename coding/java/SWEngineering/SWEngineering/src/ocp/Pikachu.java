package ocp;

import ocp.Pokemon;

public class Pikachu extends Pokemon {

    public Pikachu(String name, int level, int hp) {
        super(name, level, hp);
        System.out.println("삐까삐까");
    }

    @Override
    public void attack() {
        System.out.println(super.getName() + "이 백만볼트 공격을 합니다.");
    }

    @Override
    public void evolve() {
        super.level++;
        super.hp += 30;
        System.out.println(getName() + "이(가) " + level + "로 UP!");
    }
}
