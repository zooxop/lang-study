package isp;

public class Pikachu implements AttackablePokemon {

    @Override
    public void attack() {
        System.out.println("100만 볼트 공격 성공!");
    }

    @Override
    public void defend() {
        System.out.println("방어한다..");
    }
}
