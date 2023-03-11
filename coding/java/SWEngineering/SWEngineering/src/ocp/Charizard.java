package ocp;

public class Charizard extends Pokemon {

    public Charizard(String name, int level, int hp) {
        super(name, level, hp);
        System.out.println("리자몽");
    }

    @Override
    public void attack() {
        System.out.println(getName() + "이(가) 화염 공격을 합니다!");
    }

    @Override
    public void evolve() {
        super.level++;
        super.hp += 60;
        System.out.println(getName() + "이(가) " + level + "로 UP!");
    }
}
