package week07.dip.example;

class Pokemon implements Battleable {
    @Override
    public void attack() {
        System.out.println("공격");
    }
}

interface Battleable {
    void attack();
}

// Trainer 라는 저수준 하위 객체는 Pokemon 이라는 고수준 상위 객체에 직접적으로 의존하지 않고,
// Battleable 이라는 중간다리 interface에 의존하게 해주었다.
// => 이것이 바로 DIP, 의존성 역전을 구현한 것이다.
class Trainer {
    private final Battleable battleable;  // DIP, 의존성 역전

    public Trainer(Battleable battleable) {
        this.battleable = battleable;
    }

    public void battle() {
        this.battleable.attack();
    }

    public void catchPokemon() {
        System.out.println("포켓몬 획득");
    }
}

public class PokemonGame {
    public static void main(String[] args) {
        Pokemon pikachu = new Pokemon();
        Trainer jiwoo = new Trainer(pikachu);
        jiwoo.catchPokemon();
        jiwoo.battle();
    }
}
